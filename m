From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Wed, 30 Jan 2019 20:17:31 -0800
Message-ID: <CACMJ4GZzk3xEp93EQaevChLcOE4SCFjeSHcxkeKubjoXutouJQ@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-10-git-send-email-christopher.w.clark@gmail.com>
 <5C4EE79B0200007800211ACA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3nN-0006Gc-J8
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:17:45 +0000
Received: by mail-lf1-x144.google.com with SMTP id i26so1301801lfc.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:17:43 -0800 (PST)
In-Reply-To: <5C4EE79B0200007800211ACA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMzoyOSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI0LjAxLjE5IGF0IDAzOjA0LCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2Fy
Z28uaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyZ28uaAo+ID4gQEAgLTQ2LDYgKzQ2
LDM0IEBAIHR5cGVkZWYgdWludDMyX3QgeGVuX2FyZ29fcG9ydF90Owo+ID4gIC8qIGdmbiB0eXBl
OiA2NC1iaXQgb24gYWxsIGFyY2hpdGVjdHVyZXMgdG8gYWlkIGF2b2lkaW5nIGEgY29tcGF0IEFC
SSAqLwo+ID4gIHR5cGVkZWYgdWludDY0X3QgeGVuX2FyZ29fZ2ZuX3Q7Cj4gPgo+ID4gKy8qCj4g
PiArICogWEVOX0FSR09fTUFYSU9WIDogbWF4aW11bSBudW1iZXIgb2YgaW92cyBhY2NlcHRlZCBp
biBhIHNpbmdsZSBzZW5kdi4KPiA+ICsgKiBDYXV0aW9uIGlzIHJlcXVpcmVkIGlmIHRoaXMgdmFs
dWUgaXMgaW5jcmVhc2VkOiB0aGlzIGRldGVybWluZXMgdGhlIHNpemUgb2YKPiA+ICsgKiBhbiBh
cnJheSBvZiB4ZW5fYXJnb19pb3ZfdCBzdHJ1Y3RzIG9uIHRoZSBoeXBlcnZpc29yIHN0YWNrLCBz
byBjb3VsZCBjYXVzZQo+ID4gKyAqIHN0YWNrIG92ZXJmbG93IGlmIHRoZSB2YWx1ZSBpcyB0b28g
bGFyZ2UuCj4gPiArICogVGhlIExpbnV4IEFyZ28gZHJpdmVyIG5ldmVyIHBhc3NlcyBtb3JlIHRo
YW4gdHdvIGlvdnMuCj4gPiArICoKPiA+ICsgKiBUaGlzIHZhbHVlIHNob3VsZCBhbHNvIG5vdCBl
eGNlZWQgMTI4IHRvIGVuc3VyZSB0aGF0IHRoZSB0b3RhbCBhbW91bnQgb2YgZGF0YQo+ID4gKyAq
IHBvc3RlZCBpbiBhIHNpbmdsZSBBcmdvIHNlbmR2IG9wZXJhdGlvbiBjYW5ub3QgZXhjZWVkIDJe
MzEgYnl0ZXMsIHRvIHJlZHVjZQo+ID4gKyAqIHJpc2sgb2YgaW50ZWdlciBvdmVyZmxvdyBkZWZl
Y3RzOgo+ID4gKyAqIEVhY2ggYXJnbyBpb3YgY2FuIGhvbGQgfiAyXjI0IGJ5dGVzLCBzbyBYRU5f
QVJHT19NQVhJT1YgPD0gMl4oMzEtMjQpLAo+ID4gKyAqIGllLiBrZWVwIFhFTl9BUkdPX01BWElP
ViA8PSAxMjguCj4gPiArKi8KPiA+ICsjZGVmaW5lIFhFTl9BUkdPX01BWElPViAgICAgICAgICA4
VQo+ID4gKwo+ID4gK0RFRklORV9YRU5fR1VFU1RfSEFORExFKHVpbnQ4X3QpOwo+Cj4gVGhlcmUn
cyBubyBuZWVkIGZvciB0aGlzLCB5b3UgY2FuIHNpbXBseSB1c2UgLi4uCj4KPiA+ICt0eXBlZGVm
IHN0cnVjdCB4ZW5fYXJnb19pb3YKPiA+ICt7Cj4gPiArI2lmZGVmIFhFTl9HVUVTVF9IQU5ETEVf
NjQKPgo+IE5vdGUgdGhhdCB0aGlzIGlzIGRlZmluZWQgb25seSB3aGVuIF9fWEVOX18gb3IgX19Y
RU5fVE9PTFNfXyBhcmUKPiBkZWZpbmVkLCBpLmUuIG5vdCBmb3IgYW4gIm9yZGluYXJ5IiBjb25z
dW1lci4gSSdtIGFmcmFpZCB0aGF0IC0gYXMKPiBzYWlkIGJlZm9yZSAtIHlvdSB3b24ndCBnZXQg
YXJvdW5kIHNvbWUgdHJhbnNsYXRpb24gYXMgbG9uZyBhcyB5b3UKPiB1c2UgYW55IGZvcm0gb2Yg
aGFuZGxlcy4KCmFjay4KSSd2ZSByZXRhaW5lZCB1c2Ugb2YgdGhlIGhhbmRsZSwgc28gaGF2ZSBh
ZGRlZCBjb21wYXQgaGFuZGxpbmcgaW4gdjcuCgo+Cj4gPiArICAgIFhFTl9HVUVTVF9IQU5ETEVf
NjQodWludDhfdCkgaW92X2huZDsKPgo+IC4uLiBYRU5fR1VFU1RfSEFORExFKHVpbnQ4KSBoZXJl
Lgo+Cj4gPiArI2Vsc2UKPiA+ICsgICAgdWludDY0X3QgaW92X2huZDsKPgo+IENsZWFybHkgdGhp
cyBpcyBub3QgYSBzdWl0YWJsZSBhbHRlcm5hdGl2ZSBmb3IgYSBoYW5kbGUuCj4KPiA+IC0tLSBh
L3hlbi9pbmNsdWRlL3hsYXQubHN0Cj4gPiArKysgYi94ZW4vaW5jbHVkZS94bGF0LmxzdAo+ID4g
QEAgLTE1MiwzICsxNTIsNSBAQAo+ID4gID8gICAgYXJnb19yaW5nICAgICAgICAgICAgICAgICAg
ICAgICBhcmdvLmgKPiA+ICA/ICAgIGFyZ29fcmVnaXN0ZXJfcmluZyAgICAgICAgICAgICAgYXJn
by5oCj4gPiAgPyAgICBhcmdvX3VucmVnaXN0ZXJfcmluZyAgICAgICAgICAgIGFyZ28uaAo+ID4g
KyEgICAgYXJnb19pb3YgICAgICAgICAgICAgICAgICAgICAgICBhcmdvLmgKPgo+IEkgd2Fzbid0
IGFibGUgdG8gc3BvdCB3aGVyZSB3aGF0IHRoaXMgbGluZSBwcm9kdWNlcyBpcyBhY3R1YWxseSB1
c2VkLgo+IEFzIHBlciBhYm92ZSBJIHRoaW5rIHlvdSB3aWxsIG5lZWQgdG8gdXNlIGl0LCBidXQg
aWYgaW4gdGhlIGVuZCB0aGVyZSdzCj4gYSBkaWZmZXJlbnQgc29sdXRpb24sIHRoZW4gdGhpcyBz
aG91bGQgbm90IGJlIGFkZGVkIHdpdGhvdXQgbmVlZC4KCmFjaywgdjcgdXNlcyB0aGUgZ2VuZXJh
dGVkIFhMQVQgaXRlbSBmb3IgdHJhbnNsYXRpb24uCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
