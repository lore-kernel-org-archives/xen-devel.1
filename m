From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V8 4/7] x86/p2m: refactor p2m_reset_altp2m()
Date: Wed, 21 Nov 2018 06:19:39 -0700
Message-ID: <5BF55B6B02000078001FE7C7@prv1-mh.provo.novell.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
 <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
 <1dc9b319-f716-2891-61f4-49992a074789@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPSPx-00010h-VH
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 13:19:45 +0000
In-Reply-To: <1dc9b319-f716-2891-61f4-49992a074789@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDEyOjQ4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMS8yMS8xOCAxMDo0OSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIx
LjExLjE4IGF0IDExOjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+PiBS
ZWZhY3RvciBwMm1fcmVzZXRfYWx0cDJtKCkgc28gdGhhdCBpdCBjYW4gYmUgdXNlZCB0byByZW1v
dmUKPj4+IHJlZHVuZGFudCBjb2RlcGF0aHMsIGZpeGluZyB0aGUgbG9ja2luZyB3aGlsZSB3ZSdy
ZSBhdCBpdC4KPj4gCj4+IFN0aWxsIG5vIHdvcmQgYWJvdXQgLi4uCj4+IAo+Pj4gK3N0YXRpYyB2
b2lkIHAybV9yZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gYWx0cDJtX3Jlc2V0X3R5cGUg
cmVzZXRfdHlwZSkKPj4+ICt7Cj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+PiAr
Cj4+PiArICAgIEFTU0VSVChpZHggPCBNQVhfQUxUUDJNKTsKPj4+ICsgICAgcDJtID0gZC0+YXJj
aC5hbHRwMm1fcDJtW2lkeF07Cj4+PiArCj4+PiArICAgIHAybV9sb2NrKHAybSk7Cj4+PiArCj4+
PiArICAgIHAybV9mbHVzaF90YWJsZV9sb2NrZWQocDJtKTsKPj4+ICsKPj4+ICsgICAgaWYgKCBy
ZXNldF90eXBlID09IEFMVFAyTV9ERUFDVElWQVRFICkKPj4+ICsgICAgICAgIHAybV9mcmVlX2xv
Z2RpcnR5KHAybSk7Cj4+PiArCj4+PiArICAgIC8qIFVuaW5pdCBhbmQgcmVpbml0IGVwdCB0byBm
b3JjZSBUTEIgc2hvb3Rkb3duICovCj4+PiArICAgIGVwdF9wMm1fdW5pbml0KHAybSk7Cj4+PiAr
ICAgIGVwdF9wMm1faW5pdChwMm0pOwo+Pj4gKwo+Pj4gKyAgICBwMm0tPm1pbl9yZW1hcHBlZF9n
Zm4gPSBnZm5feChJTlZBTElEX0dGTik7Cj4+PiArICAgIHAybS0+bWF4X3JlbWFwcGVkX2dmbiA9
IDA7Cj4+IAo+PiAuLi4gdGhlc2Ugbm93IGRvbmUgZXZlbiB3aGVuIHByZXZpb3VzbHkgdGhleSB3
ZXJlbid0PyBJbiBmYWN0LAo+PiBoYXZpbmcgbG9va2VkIGFnYWluLCBpdCBzZWVtcyBhcyBpZiB0
aGVpciBvbWlzc2lvbiBmcm9tIGUuZy4KPj4gcDJtX2ZsdXNoX2FsdHAybSgpIHdhcyBhIG1pc3Rh
a2UgYmVmb3JlLCB3aGljaCB5b3Ugbm93IGZpeC4KPiAKPiBBcyBSYXp2YW4gc2F5cywgaXQgd2Fz
bid0IGEgY29ycmVjdG5lc3MgaXNzdWU7IGluIHRoZSBvdGhlciB0d28KPiAicmVzZXQtbGlrZSIg
Yml0cyBvZiBjb2RlLCB0aGUgYWx0cDJtIGlkeCB3YXMgZGlzYWJsZWQ7IHdoaWNoIGd1YXJhbnRl
ZWQKPiB0aGF0IGJlZm9yZSBiZWluZyB1c2VkIGFnYWluIGl0IHdvdWxkIGdvIHRocm91Z2ggcDJt
X2luaXRfYWx0cDJtX2VwdCgpLAo+IHdoaWNoIHJlc2V0cyB0aGVtLgoKT2guIFRoYXQgbG9va3Mg
bGlrZSBhIGxheWVyaW5nIHZpb2xhdGlvbi4gSSBjZXJ0YWlubHkgZGlkbid0IGV4cGVjdAp0aGVz
ZSBmaWVsZHMgdG8gYmUgcmVzZXQgb3V0c2lkZSBvZiBwMm0uYyArIGFsdHAybS5jLCBhbmQgdGhl
CnJlc2V0cyBtaXNzaW5nIGZyb20gcDJtX2ZsdXNoX2FsdHAybSgpIHRoZXJlZm9yZSBsb29rZWQg
bGlrZQphIG1pc3Rha2UuCgo+IFNvIHRoZSBjb2RlIGlzIHRoZSB3YXkgaXQgc2hvdWxkIGJlOyBi
dXQgaXQgc2hvdWxkIGJlIG1lbnRpb25lZCBpbiB0aGUKPiBjb21taXQgbWVzc2FnZSwgc28gdGhh
dCByZXZpZXdlcnMgLyBhcmNoYWVvbG9naXN0cyBjYW4gc2ltcGx5IHZlcmlmeSBpdAo+IHJhdGhl
ciB0aGFuIHJlLWRpc2NvdmVyaW5nIGl0LgoKUmlnaHQsIHRoYXQncyB3aGF0IEkgd2FzIHRyeWlu
ZyB0byBnZXQgYXQgd2l0aCB0aGUgZmlyc3Qgc2VudGVuY2UKKHF1ZXN0aW9uKS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
