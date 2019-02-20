From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] x86/altp2m: Rework #VE enable/disable
 paths
Date: Wed, 20 Feb 2019 07:14:27 -0700
Message-ID: <5C6D60C302000078002187A8@prv1-mh.provo.novell.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-3-git-send-email-andrew.cooper3@citrix.com>
 <0f1a8d91-082a-fa3a-6c87-5689a6263d52@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0f1a8d91-082a-fa3a-6c87-5689a6263d52@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE5IGF0IDAwOjEwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMi8yMC8xOSAxMjoxOCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gU3BsaXQg
YWx0cDJtX3ZjcHVfe2VuYWJsZSxkaXNhYmxlfV92ZSgpIG91dCBvZiB0aGUKPj4gSFZNT1BfYWx0
cDJtX3ZjcHVfe2VuYWJsZSxkaXNhYmxlfV9ub3RpZnkgbWFyc2hhbGxpbmcgbG9naWMuICBBIGZ1
dHVyZSAKPiBjaGFuZ2UKPj4gaXMgZ29pbmcgdG8gbmVlZCB0byBjYWxsIGFsdHAybV92Y3B1X2Rp
c2FibGVfdmUoKSBmcm9tIHRoZSBkb21haW5fa2lsbCgpIAo+IHBhdGguCj4+IAo+PiBXaGlsZSBh
dCBpdCwgY2xlYW4gdXAgdGhlIGxvZ2ljIGluIGFsdHAybV92Y3B1X3tpbml0aWFsaXNlLGRlc3Ry
b3l9KCkuCj4+IGFsdHAybV92Y3B1X3Jlc2V0KCkgaGFzIG5vIGV4dGVybmFsIGNhbGxlcnMsIHNv
IGZvbGQgaXQgaW50byBpdHMgdHdvCj4+IGNhbGxzaXRlcy4gIFRoaXMgaW4gdHVybiBhbGxvd3Mg
Zm9yIGFsdHAybV92Y3B1X2Rlc3Ryb3koKSB0byByZXVzZQo+PiBhbHRwMm1fdmNwdV9kaXNhYmxl
X3ZlKCkgcmF0aGVyIHRoYW4gb3BlbmNvZGluZyBpdC4KPj4gCj4+IE5vIHByYWN0aWNhbCBjaGFu
Z2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
