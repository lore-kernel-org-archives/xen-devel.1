From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: 4.11.0 RC1 panic
Date: Mon, 16 Jul 2018 05:02:01 -0600
Message-ID: <5B4C7B2902000078001D4511@prv1-mh.provo.novell.com>
References: <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
 <5B2197D3020000F004A75E9B@prv1-mh.provo.novell.com>
 <5B227CAD02000078001CB51F@prv1-mh.provo.novell.com>
 <5B30A8DD0200007003BD270D@prv1-mh.provo.novell.com>
 <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
 <20180703161728.GB18182@mail.soc.lip6.fr>
 <20180706142638.GA6124@mail.soc.lip6.fr>
 <20180716103014.GA9982@mail.soc.lip6.fr>
 <5B1FB0E5020000F903B0F0C2@prv1-mh.provo.novell.com>
 <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
 <5B2197D3020000F004A75E9B@prv1-mh.provo.novell.com>
 <5B227CAD02000078001CB51F@prv1-mh.provo.novell.com>
 <5B30A8DD0200007003BD270D@prv1-mh.provo.novell.com>
 <5B3B92D602000078001D0619@prv1-mh.provo.novell.com>
 <5B3BA1A6020000F004B7A140@prv1-mh.provo.novell.com>
 <5B3F7C2F020000D004BA0458@prv1-mh.provo.novell.com>
 <5B4C73C30200007F03CE8FF3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ff1GZ-0001zD-Up
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 11:02:07 +0000
In-Reply-To: <5B4C73C30200007F03CE8FF3@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDEyOjMwLCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4gd3JvdGU6
Cj4gT24gRnJpLCBKdWwgMDYsIDIwMTggYXQgMDQ6MjY6MzhQTSArMDIwMCwgTWFudWVsIEJvdXll
ciB3cm90ZToKPj4gT24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDY6MTc6MjhQTSArMDIwMCwgTWFu
dWVsIEJvdXllciB3cm90ZToKPj4gPiA+IFNvIGluc3RlYWQgb2YgdGhlIGRlYnVnZ2luZyBwYXRj
aCwgY291bGQgeW91IGdpdmUgdGhlIG9uZSBiZWxvdwo+PiA+ID4gYSB0cnk/Cj4+ID4gCj4+ID4g
U3VyZSwgdGhlIHRlc3Qgc2VydmVyIGlzIG5vdyBydW5uaW5nIHdpdGggaXQuCj4+ID4gQXMgSSdt
IHN0aWxsIHVzaW5nIDQuMTFyYzQgc291cmNlcyBJIGhhZCB0byBhZGp1c3QgaXQgYSBiaXQgKHRo
ZSBzZWNvbmQgY2h1bmsKPj4gPiBkaWRuJ3QgYXBwbHkgY2xlYW5seSkgYnV0IGl0IGRpZG4ndCBs
b29rIGRpZmZpY3VsdCB0byBmaXggaXQuCj4+ID4gCj4+ID4gTm93IGxldHMgd2FpdCBmb3Igc29t
ZSBhdXRvbWF0ZWQgdGVzdHMgcnVuIHRvIGNvbXBsZXRlIC4uLgo+PiAKPj4gU28gZmFyIG5vIGNy
YXNoLCBzbyB0aGlzIGxvb2tzIGdvb2QuIEJ1dCB0aGVyZSBoYXMgYmVlbiBvbmx5IDE0IHJ1bnMs
Cj4+IGFuZCBhIGZldyBvZiB0aGVtIGRpZCBub3QgY29tcGxldGUgZm9yIHVucmVsYXRlZCBpc3N1
ZXMsIHNvIGl0IHdvdWxkIG5lZWQKPj4gYSBiaXQgbW9yZSB0aW1lIHRvIGJlIHN1cmUuCj4+IAo+
PiBJJ20gYWJvdXQgdG8gbGVhdmUgZm9yIGEgb25lIHdlZWsgdmFjYXRpb247IEkgbWF5IGhhdmUg
bmV0d29yayBhY2Nlcwo+PiBhbmQga2VlcCBhbiBleWUgb24gaXQgYnV0IG5vIHByb21pc2UuIE1v
cmUgbmV3IG9uIG1vbmRheSAxNi4KPiAKPiBVbmZvcnR1bmFibHkgdGhlcmUgaGFzIGJlZW4gYSBj
cmFzaCBsYXN0IHdlZWs6CgpIbW0sIGxvb2tzIHRvIGJlIHN0aWxsIGFsbCB0aGUgc2FtZSBhcyBi
ZWZvcmUgKGV4Y2VwdCBmb3IgdGhlIGxpbmUKbnVtYmVyKS4gSSdtIGFmcmFpZCBJJ20gb3V0IG9m
IGlkZWFzLCBhdCBsZWFzdCBmb3IgdGhlIG1vbWVudC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
