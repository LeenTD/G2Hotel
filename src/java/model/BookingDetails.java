/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class BookingDetails {
    private int IDBooking;
    private int IDAccount;
    private String FullName;
    private String Gender;
    private String Phone;
    private String Email;

    public BookingDetails(int IDBooking, int IDAccount, String FullName, String Gender, String Phone, String Email) {
        this.IDBooking = IDBooking;
        this.IDAccount = IDAccount;
        this.FullName = FullName;
        this.Gender = Gender;
        this.Phone = Phone;
        this.Email = Email;
    }

    public int getIDBooking() {
        return IDBooking;
    }

    public void setIDBooking(int IDBooking) {
        this.IDBooking = IDBooking;
    }

    public int getIDAccount() {
        return IDAccount;
    }

    public void setIDAccount(int IDAccount) {
        this.IDAccount = IDAccount;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    @Override
    public String toString() {
        return "BookingDetails{" + "IDBooking=" + IDBooking + ", IDAccount=" + IDAccount + ", FullName=" + FullName + ", Gender=" + Gender + ", Phone=" + Phone + ", Email=" + Email + '}';
    }
    
}