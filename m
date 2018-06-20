From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] xen: Two possible sleep-in-atomic-context bugs in
 bind_evtchn_to_irqhandler()
Date: Wed, 20 Jun 2018 10:49:28 +0800
Message-ID: <80315b22-63c1-c8cc-1035-11fa36bee83a__11646.8197353699$1529462927$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zml5=jg=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1fVTC5-00074T-0a
 for xen-devel@lists.xenproject.org; Wed, 20 Jun 2018 02:50:01 +0000
Received: by mail-pl0-x242.google.com with SMTP id 31-v6so903119plc.4
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jun 2018 19:49:59 -0700 (PDT)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGRyaXZlciBtYXkgc2xlZXAgd2l0aCBob2xkaW5nIGEgc3BpbmxvY2suClRoZSBmdW5jdGlv
biBjYWxsIHBhdGhzIChmcm9tIGJvdHRvbSB0byB0b3ApIGluIExpbnV4LTQuMTYuNyBhcmU6Cgpb
RlVOQ10gbXV0ZXhfbG9ja19uZXN0ZWQgLS0+IGNhbiBzbGVlcApkcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYywgODM5OiBtdXRleF9sb2NrX25lc3RlZCBpbiAKYmluZF9ldnRjaG5fdG9f
aXJxCmRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jLCAxMDMwOiBiaW5kX2V2dGNobl90
b19pcnEgaW4gCmJpbmRfZXZ0Y2huX3RvX2lycWhhbmRsZXIKZHJpdmVycy94ZW4vcHZjYWxscy1m
cm9udC5jLCAzNzE6IGJpbmRfZXZ0Y2huX3RvX2lycWhhbmRsZXIgaW4gY3JlYXRlX2FjdGl2ZQpk
cml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMsIDQxNzogY3JlYXRlX2FjdGl2ZSBpbiBwdmNhbGxz
X2Zyb250X2Nvbm5lY3QKZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jLCA0MTA6IHNwaW5fbG9j
ayBpbiBwdmNhbGxzX2Zyb250X2Nvbm5lY3QKCltGVU5DXSByZXF1ZXN0X2lycSAtLT4gY2FuIHNs
ZWVwCmRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jLCAxMDAzOiByZXF1ZXN0X2lycSBp
biAKYmluZF9ldnRjaG5fdG9faXJxaGFuZGxlcgpkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMs
IDM3MTogYmluZF9ldnRjaG5fdG9faXJxaGFuZGxlciBpbiBjcmVhdGVfYWN0aXZlCmRyaXZlcnMv
eGVuL3B2Y2FsbHMtZnJvbnQuYywgNDE3OiBjcmVhdGVfYWN0aXZlIGluIHB2Y2FsbHNfZnJvbnRf
Y29ubmVjdApkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMsIDQxMDogc3Bpbl9sb2NrIGluIHB2
Y2FsbHNfZnJvbnRfY29ubmVjdAoKVGhlc2UgYnVncyBhcmUgZm91bmQgYnkgbXkgc3RhdGljIGFu
YWx5c2lzIHRvb2wgKERTQUMtMikgYW5kIGNoZWNrZWQgYnkgbXkKY29kZSByZXZpZXcuCgpJIGRv
IG5vdCBrbm93IGhvdyB0byBjb3JyZWN0bHkgZml4IHRoZXNlIGJ1Z3MsIHNvIEkganVzdCByZXBv
cnQgdGhlbS4KTWF5YmUgY3JlYXRlX2FjdGl2ZSgpIHNob3VsZCBub3QgYmUgY2FsbGVkIHdpdGgg
aG9sZGluZyBhIHNwaW5sb2NrLgoKCkJlc3Qgd2lzaGVzLApKaWEtSnUgQmFpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
