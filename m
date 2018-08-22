From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v17 12/13] x86/hvm: Remove redundant save
 functions
Date: Wed, 22 Aug 2018 18:22:15 +0300
Message-ID: <1534951335.20997.14.camel@bitdefender.com>
References: <1534946563-12084-1-git-send-email-aisaila@bitdefender.com>
 <1534946563-12084-13-git-send-email-aisaila@bitdefender.com>
 <20180822150423.4gb4q66guorbgupb@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180822150423.4gb4q66guorbgupb@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, paul.durrant@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

PiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCBoYW5kbGVyKGQsIGgpICE9
IDAgKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggaGFuZGxlcihkLT52Y3B1WzBd
LCBoKSAhPSAwICkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgewo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaW50ayhYRU5MT0dfR19FUlIKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkhWTSVkIHNhdmU6IGZhaWxl
ZCB0byBzYXZlIHR5cGUKPiA+ICUiUFJJdTE2IlxuIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkhWTSBkJWQgc2F2ZTogZmFpbGVkIHRvIHNhdmUg
dHlwZQo+ID4gJSJQUkl1MTYiXG4iLAo+IFRoaXMgbG9va3MgbGlrZSBhbiB1bnJlbGF0ZWQgY2hh
bmdlLgpJIHdhbnRlZCB0byBjaGFuZ2UgdGhpcyBzbyBpdCBjb3VsZCBiZSBpbiB0aGUgc2FtZSBv
cmRlciBhcyB0aGUKcGVyX3ZjcHUgcHJpbnQgdGhhdCB3YXMgbW9kaWZpZWQgYXQgSmFuJ3MgcmVx
dWVzdC4KTm93IHRoZSBwcmludCBpcyBzb21ldGhpbmcgbGlrZToKCiIKKFhFTikgSFZNIGQydjAg
c2F2ZTogQ1BVCihYRU4pIEhWTSBkMnYxIHNhdmU6IENQVQooWEVOKSBIVk0gZDIgc2F2ZTogUElD
CihYRU4pIEhWTSBkMiBzYXZlOiBJT0FQSUMKKFhFTikgSFZNIGQydjAgc2F2ZTogTEFQSUMKIgpp
biBvcHBvc2UgdG8gaGF2aW5nICIoWEVOKSBIVk0yIHNhdmU6IFBJQyIuCgpJZiB0aGUgY2hhbmdl
IGlzIG5vdCBuZWVkZWQgSSBjYW4gZHJvcCBpdC4KClRoYW5rcyzCoApBbGV4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
