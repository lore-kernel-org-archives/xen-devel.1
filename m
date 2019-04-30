From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 04:27:18 -0600
Message-ID: <5CC82306020000780022A4E3@prv1-mh.provo.novell.com>
References: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLPyx-0002nj-IN
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:27:27 +0000
In-Reply-To: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE5IGF0IDExOjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbiB4
ZW4vY29tbW9uL3NjaGVkdWxlLmMgdGhlcmUgaXMgYSB3ZWlyZCAiI2lmbmRlZiBDT05GSUdfWDg2
IiBpbgo+IGRvX3BvbGwoKS4KPiAKPiBJdCB3YXMgaW50cm9kdWNlZCB3YXkgYmVmb3JlIGFueW9u
ZSB3b3VsZCB0aGluayBhYm91dCBBUk0gYnkgY29tbWl0Cj4gZWY0YzZiMDc5Y2M1NWUgKEkgY291
bGRuJ3QgZmluZCBhbnkgeGVuLWRldmVsIG1haWwgcmVsYXRlZCB0byB0aGF0Cj4gY29tbWl0KSwg
c28gSSBndWVzcyBpdCBpcyByZWxhdGVkIHRvIElBNjQ/CgpRdWl0ZSBjZXJ0YWlubHksIHllcyAo
b3IgUFBDIGFzIGFuIGFsdGVybmF0aXZlLCBidXQgSSBrbm93IG5vdGhpbmcKYWJvdXQgdGhlaXIg
bWVtb3J5IG9yZGVyaW5nIG1vZGVsKS4KCj4gUXVlc3Rpb24gaXM6IGNhbiB3ZSBqdXN0IGRyb3Ag
aXQsIG9yIGRvZXMgQVJNIGRlcGVuZCBvbiBpdD8gQW5kIGlmIEFSTQo+IHJlYWxseSBuZWVkcyBp
dCwgaXMgaXQgdGhlIG1lbW9yeSBiYXJyaWVyIG9ubHk/IEFuZCB3aHkgd291bGRuJ3QgYQo+IHNp
bWlsYXIgYmFycmllciBiZSBuZWVkZWQgaW4gdmNwdV9ibG9jaygpIHRoZW4/CgpJdCdzIG5vdCB0
aGUgbWVtb3J5IGJhcnJpZXIsIGJ1dCB0aGUgc3Vic2VxdWVudCBjaGVja3MuIFRoZSBiYXJyaWVy
CmlzIHRoZXJlIG9ubHkgdG8gbWFrZSBzdXJlIHRoZSBjaGVja3MgZG9uJ3QgaGFwcGVuIGJlZm9y
ZSB0aGUKZWFybGllciB3cml0ZXMuIEFuZCBhcyB0aGUgY29tbWVudCBzYXlzIC0gaXQncyB0aGUg
Y29tYmluYXRpb24gb2YKdGhlIDMgd3JpdGVzIHRoYXQgbWF5IGdldCBtaXMtb3JkZXJlZCBhbmQg
aGVuY2UgbWlzLWludGVycHJldGVkIGJ5Cm90aGVyIChyZWFkaW5nKSBwYXJ0aWVzLiB2Y3B1X2Js
b2NrKCksIG90b2gsIHNldHMgdGhlIFZQRl9ibG9ja2VkCmJpdCBvbmx5LCBzbyB0aGVyZSdzIG5v
IHBvdGVudGlhbCBvcmRlcmluZyBpc3N1ZSB0aGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
