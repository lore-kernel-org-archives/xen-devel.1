From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 9/9] x86/IO-APIC: drop an unused variable from
 setup_IO_APIC_irqs()
Date: Mon, 29 Apr 2019 05:27:04 -0600
Message-ID: <5CC6DF880200007800229EC8@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4RB-0008Tk-0X
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:27:09 +0000
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TXVzdCBiZSBhIGxlZnQtb3ZlciBmcm9tIGVhcmxpZXIgZGF5cy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwpAQCAtOTg0LDggKzk4NCw2IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cF9JT19BUElDX2lycXModm8KIAogICAgIGZvciAoYXBpYyA9IDA7
IGFwaWMgPCBucl9pb2FwaWNzOyBhcGljKyspIHsKICAgICAgICAgZm9yIChwaW4gPSAwOyBwaW4g
PCBucl9pb2FwaWNfZW50cmllc1thcGljXTsgcGluKyspIHsKLSAgICAgICAgICAgIHN0cnVjdCBp
cnFfZGVzYyAqZGVzYzsKLQogICAgICAgICAgICAgLyoKICAgICAgICAgICAgICAqIGFkZCBpdCB0
byB0aGUgSU8tQVBJQyBpcnEtcm91dGluZyB0YWJsZToKICAgICAgICAgICAgICAqLwpAQCAtMTAz
OCw3ICsxMDM2LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX0lPX0FQSUNfaXJxcyh2bwog
ICAgICAgICAgICAgaWYgKHBsYXRmb3JtX2xlZ2FjeV9pcnEoaXJxKSkKICAgICAgICAgICAgICAg
ICBkaXNhYmxlXzgyNTlBX2lycShpcnFfdG9fZGVzYyhpcnEpKTsKIAotICAgICAgICAgICAgZGVz
YyA9IGlycV90b19kZXNjKGlycSk7CiAgICAgICAgICAgICBTRVRfREVTVChlbnRyeSwgbG9naWNh
bCwgY3B1X21hc2tfdG9fYXBpY2lkKFRBUkdFVF9DUFVTKSk7CiAgICAgICAgICAgICBzcGluX2xv
Y2tfaXJxc2F2ZSgmaW9hcGljX2xvY2ssIGZsYWdzKTsKICAgICAgICAgICAgIF9faW9hcGljX3dy
aXRlX2VudHJ5KGFwaWMsIHBpbiwgMCwgZW50cnkpOwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
