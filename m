From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: libxc: Casting of xen virtual address type xen_vaddr_t
 to signed int64 type: (int64_t)vaddr
Date: Fri, 17 May 2019 14:25:41 +0300
Message-ID: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRazp-0001Nn-MS
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:25:53 +0000
Received: by mail-io1-xd2d.google.com with SMTP id s20so5173322ioj.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:25:53 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKV2hpbGUgbG9va2luZyBhdCBjb2RlIGluIHRvb2xzL2xpYnhjL3hjX3NyX3NhdmVf
eDg2X3B2LmMsCndlIHNlZSB0aGF0IHRoZXJlIGlzIGNhc3Rpbmcgb2YgeGVuIHZpcnR1YWwgYWRk
cmVzcyB0eXBlIHhlbl92YWRkcl90CnRvIHNpZ25lZCBpbnQ2NCB0eXBlLgpJbiBjb21taXQ6IDdi
Zjc0NTgyYjM0MzYwM2NiMDgyNmQ4MDhjZDdkYTQzMzI2NDUyYTUKCisvKiBDaGVjayBhIDY0IGJp
dCB2aXJ0dWFsIGFkZHJlc3MgZm9yIGJlaW5nIGNhbm9uaWNhbC4gKi8KK3N0YXRpYyBpbmxpbmUg
Ym9vbCBpc19jYW5vbmljYWxfYWRkcmVzcyh4ZW5fdmFkZHJfdCB2YWRkcikKK3sKKyAgICByZXR1
cm4gKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpOworfQoK
SXQgc2VlbXMgdGhlcmUgaXMgbm8gbmVlZCB0byBjYXN0IHZhZGRyIHZhcmlhYmxlLiBJdCBsb29r
cyBsaWtlCnNoaWZ0aW5nIHZhZGRyIHNpZ25lZCA2NC1iaXQgdmFsdWUgYnkgNjMgYml0cyBpbnRy
b2R1Y2VzIHVuZGVmaW5lZApiZWhhdmlvci4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB3aGF0
IGlzIHRoZSByZWFzb24gZm9yIHRoaXMKY2FzdGluZz8KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
