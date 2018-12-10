From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/hvm/viridian: stop open coding updates
 to APIC registers
Date: Mon, 10 Dec 2018 14:56:40 +0000
Message-ID: <630ac633c6c94148956e49b7ffabfa8c@AMSPEX02CL03.citrite.net>
References: <20181207175008.2146-1-paul.durrant@citrix.com>
 <5C0E6DBA0200007800204ADE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8DVg=OT=citrix.com=prvs=875e259b5=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWMzi-0003Ul-7l
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:57:14 +0000
In-Reply-To: <5C0E6DBA0200007800204ADE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTAgRGVjZW1iZXIgMjAxOCAxMzo0NAo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVy
IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lCj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8
eGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHg4Ni9odm0vdmlyaWRpYW46IHN0b3Agb3BlbiBjb2RpbmcgdXBkYXRlcyB0byBBUElDCj4gcmVn
aXN0ZXJzCj4gCj4gPj4+IE9uIDA3LjEyLjE4IGF0IDE4OjUwLCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gVGhlIGNvZGUgaW4gdmlyaWRpYW5fc3luaWNfd3Jtc3IoKSBkdXBs
aWNhdGVzIGxvZ2ljIGluCj4gdmxhcGljX3JlZ193cml0ZSgpCj4gPiB0byB1cGRhdGUgdGhlIElD
UiwgSUNSMiBhbmQgVEFTS1BSSSByZWdpc3RlcnMuIEluc3RlYWQgb2YgZG9pbmcgdGhpcywKPiA+
IG1ha2UgdmxhcGljX3JlZ193cml0ZSgpIG5vbi1zdGF0aWMgYW5kIGNhbGwgaXQuCj4gCj4gVGhl
cmUncyBhIHNpZGUgZWZmZWN0IGZyb20gdGhpcyBjaGFuZ2UsIHdoaWNoIEkgdGhpbmsgc2hvdWxk
IGJlIGNhbGxlZAo+IG91dCBzaW5jZSBwZXJoYXBzIGl0J3MgYWN0dWFsbHkgYSAobWlub3IpIGJ1
ZyBmaXg6IHZsYXBpY19yZWdfd3JpdGUoKQo+IGNsZWFycyBvdXQgdmxhcGljLT5sb2FkZWQsIHdo
aWNoIHRoZSBvcGVuIGNvZGVkIFZpcmlkaWFuIGNvZGUgZGlkbid0Cj4gZG8uCj4gCgpZZXMsIHRo
YXQgd2FzIGFuIGFub21hbHkgYW5kIGRpZCBsb29rIHdyb25nLgoKPiBJZiBpdCB3YXNuJ3QgZm9y
IHRoaXMsIEkgd291bGQgaGF2ZSBiZWVuIHVuY2VydGFpbiB3aGV0aGVyIGV4cG9zaW5nIGEKPiBm
dW5jdGlvbiB0aGF0IHJlYWxseSB3YXMgbWVhbnQgdG8gYmUgdmxhcGljLmMtaW50ZXJuYWwgaXMg
YSBnb29kIGlkZWEuCj4gCgpVbmZvcnR1bmF0ZWx5IHRoZSB3YXkgdGhhdCBNaWNyb3NvZnQgc3Bl
Y2lmeSB0aGUgU3luSUMgKGFzIGEgInN1cGVyc2V0IG9mIHRoZSBsb2NhbCBBUElDIikgbWVhbnMg
dGhhdCB0aGUgY29kZSBkb2VzIG5lZWQgdG8gYmUgY2xvc2VseSB0aWVkLiBEbyB5b3Ugd2FudCBt
ZSB0byBmb3JtdWxhdGUgYSBjb21tZW50IGFuZCBzdWJtaXQgYSB2Miwgb3IgYXJlIHlvdSBoYXBw
eSB0byBhZGQgYSBjb21tZW50IG9uIGNvbW1pdD8KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
