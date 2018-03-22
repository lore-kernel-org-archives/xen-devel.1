From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3a 00/39] (0/3) Fixups for the new VGIC(-v2)
 implementation
Date: Thu, 22 Mar 2018 11:56:46 +0000
Message-ID: <20180322115649.5283-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sasr=gm=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eyyq6-0005vK-SJ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 11:57:02 +0000
Received: by mail-wr0-x236.google.com with SMTP id o8so8398775wra.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 04:57:01 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgp0aGlzIGlzIGp1c3QgYW4gdXBkYXRlIG9mIHRoZSB0aHJlZSBwYXRjaGVzIHdoaWNoIGRp
ZG4ndCBnZXQgYW55IHJldmlldwp0YWdzIHNvIGZhci4KVGhlIGZpeGVzIGZvciB0aGUgbmV3IHZl
cnNpb25zIG9mIDAzLzM5IGFuZCAzOS8zOSBhcmUgcHJldHR5IHN0cmFpZ2h0CmZvcndhcmQsIGJ1
dCAxNC8zOSBpcyBtb3JlIG9mIGEgYmVhc3QuIEkgc2VudCBhIGRpZmYgdG8gdGhlIG9yaWdpbmFs
CnBhdGNoIFsxXSBzZXBhcmF0ZWx5IHRvIGdpdmUgYW4gaWRlYSBvZiB0aGUgY2hhbmdlcy4KCkkg
YWRkZWQgdGhlIFItYjogYW5kIEEtYjogdGFncyBhbG9uZyB3aXRoIHRoZSBOSVQgZml4ZXMgdG8g
bXkgdHJlZSBhbmQKd2lsbCBsYXRlciBwdXNoIGEgYnJhbmNoIHdpdGggdGhvc2UgdGFncyBhbmQg
dGhlc2UgZml4ZXMgaGVyZSBpbiBhIHNvbWV3aGF0CmZpbmFsIHZlcnNpb24uCkxvb2sgb3V0IGZv
ciB0aGUgdmdpYy1uZXcvdjNhIGJyYW5jaCBhcHBlYXJpbmcgYXQKaHR0cDovL3d3dy5saW51eC1h
cm0ub3JnL2dpdD9wPXhlbi1hcC5naXQKCkNoZWVycywKQW5kcmUKClsxXSBodHRwczovL2xpc3Rz
Lnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wMy9tc2cwMjY4MC5odG1sCgot
LS0KQ2hhbmdlbG9nIHYzIC4uLiB2M2E6IChjb3BpZWQgZnJvbSB0aGUgcGF0Y2hlcycgY2hhbmdl
bG9nKQowMy8zOToKLSBhbHdheXMgc2V0L2NsZWFyIF9JUlFfSU5QUk9HUkVTUyBiaXQgKG5vdCBv
bmx5IGZvciBndWVzdCBJUlFzKQotIGFkZCBjb21tZW50cwoxNC8zOToKLSB0YWtlIGhhcmR3YXJl
IElSUSBsb2NrIGluIHZnaWNfdjJfZm9sZF9scl9zdGF0ZSgpCi0gZml4IGxhc3QgcmVtYWluaW5n
IHUzMiB1c2FnZQotIHByaW50IG1lc3NhZ2Ugd2hlbiB1c2luZyBuZXcgVkdJQwotIGFkZCBUT0RP
IGFib3V0IHJhY3kgX0lSUV9JTlBST0dSRVNTIHNldHRpbmcKMzkvMzk6Ci0gcHJpbnQgcGFuaWMg
d2hlbiB0cnlpbmcgdG8gcnVuIG9uIEdJQ3YzIGhhcmR3YXJlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
