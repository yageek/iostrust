require 'sqlite3'
require 'fileutils'
require 'date'
require 'openssl'
module Iostrust
  class Simulator

    def initialize(path)
      @path = path
    end

    def backup_path
      "#{@path}.iostrust.backup"
    end
    def backup
      FileUtils.cp_r(@path, backup_path)
    end

    def restore
      return if not File.exists? backup_path
      FileUtils.rm_r(@path)
      FileUtils.mv(backup_path, @path)
    end

    def add_cert(cert)
      puts "Start adding to #{@path}:"
      puts "Backup"
      backup()

      puts "Adding #{cert.cert_name}"
      SQLite3::Database.new @path do |db|

        sha1 = SQLite3::Blob.new(cert.sha1)
        subj = SQLite3::Blob.new(cert.subj)
        tset = SQLite3::Blob.new(cert.tset)
        data = SQLite3::Blob.new(cert.data)

        begin
          db.execute "INSERT INTO 'tsettings' (sha1, subj, tset, data) VALUES(?,?,?,?)", sha1, subj, tset, data
        rescue SQLite3::ConstraintException => e
          puts "Certificates was not added : Already presents"
        else
          puts "OK"
        end
      end
    end

    def add_certs(certs)
      certs.each { |cert| add_cert(cert) }
    end
  end
end
