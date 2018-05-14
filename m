From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: staging-4.6 seems to be broken
Date: Mon, 14 May 2018 07:40:27 -0600
Message-ID: <5AF991CB02000078001C27E2@prv1-mh.provo.novell.com>
References: <osstest-122657-mainreport@xen.org>
 <23285.45184.391313.794468@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIDiL-0008QV-ED
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 13:40:33 +0000
In-Reply-To: <23285.45184.391313.794468@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA1LjE4IGF0IDE3OjAyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC42LXRlc3RpbmcgdGVzdF0g
MTIyNjU3OiByZWdyZXNzaW9ucyAtIAo+IEZBSUwiKToKPj4gZmxpZ2h0IDEyMjY1NyB4ZW4tNC42
LXRlc3RpbmcgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9sb2dzLzEyMjY1Ny8gCj4+IAo+PiBSZWdyZXNzaW9ucyA6LSgKPj4gCj4+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+PiBpbmNsdWRpbmcg
dGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4gIHRlc3QteHRmLWFtZDY0LWFtZDY0LTIg
NTAgeHRmL3Rlc3QtaHZtNjQtbGJyLXRzeC12bWVudHJ5IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQo+
PiAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQgMTggZ3Vlc3Qtc3RhcnQvZGViaWFuLnJlcGVhdCBm
YWlsIFJFR1IuIHZzLiAxMjI0NjEKPj4gIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbSAxOCBn
dWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQo+PiAgdGVzdC1h
bWQ2NC1pMzg2LWxpYnZpcnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAxNiBndWVzdC1zdGFy
dC9kZWJpYW5odm0ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQo+PiAgdGVzdC1hbWQ2NC1p
Mzg2LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC1zaGFkb3cgMTYgZ3Vlc3QtbG9jYWxtaWdyYXRl
L3gxMCBmYWlsIFJFR1IuIHZzLiAxMjI0NjEKPj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1v
dm1mLWFtZDY0IDE4IGd1ZXN0LXN0YXJ0L2RlYmlhbmh2bS5yZXBlYXQgZmFpbCBSRUdSLiB2cy4g
MTIyNDYxCj4gCj4gQXQgbGVhc3Qgc29tZSBvZiB0aGVzZSBhcmUgc3VyZWx5IHJlYWwgcmVncmVz
c2lvbnMuCgpBcmUgeW91IHNheWluZyB0aGF0IGp1c3QgYmVjYXVzZSBvZiB0aGUgYW1vdW50IG9m
IGZhaWx1cmVzIGFib3ZlLCBvcgpiZWNhdXNlIG9mIHNvbWUgb2JzZXJ2YXRpb25zIGZyb20gbG9n
IGZpbGVzIG9yIGFsaWtlPyBJJ20gYXNraW5nIGJlY2F1c2UKMTIyNjk5IGxvb2tzIHF1aXRlIGEg
Yml0IGJldHRlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
