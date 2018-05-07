From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/5] doc: correct livepatch.markdown
 syntax
Date: Mon, 7 May 2018 11:37:11 +0100
Message-ID: <95c02851-298c-279e-e4de-2bee909e659c@citrix.com>
References: <20180507101608.797-1-jgross@suse.com>
 <20180507101608.797-4-jgross@suse.com>
 <9451c973-62e7-38a6-b264-450a854f2624@citrix.com>
 <49bcd73a-ffdf-8c34-3c48-d7a97f8fdc24@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lyzs=h2=citrix.com=prvs=658a9d8f8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fFdW7-0006wz-7c
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:37:15 +0000
In-Reply-To: <49bcd73a-ffdf-8c34-3c48-d7a97f8fdc24@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMTggMTE6MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDcvMDUvMTggMTI6
MjMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA3LzA1LzE4IDExOjE2LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gIm1ha2UgLUMgZG9jcyBhbGwiIGZhaWxzIGR1ZSB0byBpbmNvcnJlY3Qg
bWFya2Rvd24gc3ludGF4IGluCj4+PiBsaXZlcGF0Y2gubWFya2Rvd24uIENvcnJlY3QgaXQuCj4+
IFdoaWNoIHZlcnNpb24gb2YgbWFya2Rvd24sIG9vaT/CoCBWZXJzaW9uIDEuMC4xIHNlZW1zIGZp
bmUgd2l0aCB0aGlzLgo+Pgo+IC4uLgo+IC91c3IvYmluL3BhbmRvYyAtLW51bWJlci1zZWN0aW9u
cyAtLXRvYyAtLXN0YW5kYWxvbmUKPiBtaXNjL2xpdmVwYXRjaC5tYXJrZG93biAtLW91dHB1dCBw
ZGYvbWlzYy9saXZlcGF0Y2gucGRmCj4gISBMYVRlWCBFcnJvcjogQ29tbWFuZCBcdGV4dHF1b3Rl
c2luZ2xlIHVuYXZhaWxhYmxlIGluIGVuY29kaW5nIFQxLgo+Cj4gU2VlIHRoZSBMYVRlWCBtYW51
YWwgb3IgTGFUZVggQ29tcGFuaW9uIGZvciBleHBsYW5hdGlvbi4KPiBUeXBlICBIIDxyZXR1cm4+
ICBmb3IgaW1tZWRpYXRlIGhlbHAuCj4gIC4uLgo+Cj4gbC4yNTEgLi4ubmN0aW9uXCB0b1wgZGly
ZWN0bHlcIGp1bXBcIHRvXCB0aGVcIG5ld30KPgo+IHBhbmRvYzogRXJyb3IgcHJvZHVjaW5nIFBE
Rgo+IE1ha2VmaWxlOjI1NzogcmVjaXBlIGZvciB0YXJnZXQgJ3BkZi9taXNjL2xpdmVwYXRjaC5w
ZGYnIGZhaWxlZAo+IG1ha2U6ICoqKiBbcGRmL21pc2MvbGl2ZXBhdGNoLnBkZl0gRXJyb3IgNDMK
Pgo+IGdyb3NzQERlc2t0b3A6fi94ZW4vZG9jcz4gL3Vzci9iaW4vcGFuZG9jIC0tdmVyc2lvbgo+
IHBhbmRvYyAxLjE5LjIuMQo+IENvbXBpbGVkIHdpdGggcGFuZG9jLXR5cGVzIDEuMTcuMC41LCB0
ZXhtYXRoIDAuOS4xLCBza3lsaWdodGluZyAwLjEuMS41Cj4gRGVmYXVsdCB1c2VyIGRhdGEgZGly
ZWN0b3J5OiAvaG9tZS9ncm9zcy8ucGFuZG9jCj4gQ29weXJpZ2h0IChDKSAyMDA2LTIwMTYgSm9o
biBNYWNGYXJsYW5lCj4gV2ViOiAgaHR0cDovL3BhbmRvYy5vcmcKCkFjY29yZGluZyB0byBodHRw
czovL2dpdGh1Yi5jb20vamdtL3BhbmRvYy9pc3N1ZXMvMjQzOSwgdGhpcyBpcyBhCnBhY2thZ2lu
ZyBpc3N1ZSwgYW5kIG1hbnVhbGx5IGluc3RhbGxpbmcgdGV4bGl2ZS1sYXRleC1leHRyYSByZXNv
bHZlcwp0aGUgcHJvYmxlbS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
