From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 for-4.12 10/17] argo: implement the
 notify op
Date: Thu, 07 Feb 2019 06:05:49 -0700
Message-ID: <5C5C2D2D0200007800214A16@prv1-mh.provo.novell.com>
References: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
 <1549443308-24448-11-git-send-email-christopher.w.clark@gmail.com>
 <5c9d887c-7329-35a9-d98d-a9f6fe3b7486@arm.com>
 <CACMJ4GZj+_YJY7O+SaxZQfWKzan+T2bKGb70EtXfXu2+P4LnSQ@mail.gmail.com>
 <ca56b2ef-ba5f-071d-306d-61b6e00a2426@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grjNL-0001BX-4W
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 13:05:55 +0000
In-Reply-To: <ca56b2ef-ba5f-071d-306d-61b6e00a2426@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDEwOjA0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIvNy8xOSA2OjMyIEFNLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPj4gSXQgdXNlcyB0
aGF0IG51bGwgdGVzdCBiZWNhdXNlIGJvdGggYXJlIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0gdHlw
ZSBpbgo+PiB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlOgo+PiAKPj4gbG9uZyBkb19hcmdvX29wKAo+
PiAgICAgIHVuc2lnbmVkIGludCBjbWQsCj4+ICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2
b2lkKSBhcmcxLAo+PiAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnMiwKPj4g
ICAgICB1bnNpZ25lZCBsb25nIGFyZzMsCj4+ICAgICAgdW5zaWduZWQgbG9uZyBhcmc0KTsKPj4g
Cj4+IGFuZCBzaW5jZSBpdCBkb2VzIHRoYXQsIHRoZSBjb21tZW50IHN0YXRlcyBOVUxMIHJhdGhl
ciB0aGFuIHplcm8uCj4+IAo+PiBJdCBpcyBYZW4ncyBkZWZpbml0aW9uIGZvciBOVUxMIHRoYXQg
aXMgdXNlZCwgc28gdGhlIGV4cGVjdGVkIHZhbHVlIGluCj4+IHRoZSByZWdpc3RlciB3aGVuIHRo
ZSBoeXBlcmNhbGwgaXMgaW52b2tlZCBpczogemVyby4KPiAKPiBBcyBhYm92ZSwgSSBkb24ndCB0
aGluayBpdCBpcyBjbGVhcmx5IGRlZmluZSBpbiB0aGUgaGVhZGVycyB0aGF0IE5VTEwgCj4gbWVh
bnMgMC4gVGhpcyBpcyByYXRoZXIgYW4gaW1wbGljaXQgd3JpdHRlbiBydWxlcyBpbiB0aGUgaG9w
ZSB0aGF0IGV2ZXJ5IAo+IE9TIGFyZSBnb2luZyB0byBmb2xsb3cgdGhhdC4KPiAKPiBJIGtub3cs
IEkgYW0gcGVkYW50aWMgaGVyZSAoaGVuY2UgdGhlIE5JVCkgOikuIEFuZCBJIHJlYWxpemUgdGhp
cyBpcyBub3QgCj4gcmVsYXRlZCB0byB0aGlzIHNlcmllcyBhbmQgYSBmZXcgcGxhY2VzIGluIHRo
ZSBjb2RlIGFzc3VtZXMgdGhlIHNhbWUuCgpFeGFjdGx5IC0ganVzdCBncmVwIHRoZSBwdWJsaWMg
aGVhZGVycy4gVGhlIGFzc3VtcHRpb24gaXMgdGhhdCBhIG51bGwKaGFuZGxlIGlzIGEgdHlwZS13
cmFwcGVkIHJlcHJlc2VudGF0aW9uIG9mIGEgTlVMTCBwb2ludGVyLiBBbGwKcGxhdGZvcm1zIFhl
biBydW5zIG9uIG9yIGhhcyBydW4gb24gaGF2ZSBOVUxMIGhhdmUgYSBiaW5hcnkKcmVwcmVzZW50
YXRpb24gb2YgemVybyBhZmFpay4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
