From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Tue, 27 Nov 2018 10:25:49 +0100
Message-ID: <827a7f6f-dd04-f07b-2fe9-02c62c6ee3c6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mf6g=og=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRZcv-0001kD-O4
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:25:53 +0000
References: =?UTF-8?B?PDIwMTgxMTIzMTMyNTE2LjI4Njgx77+977+977+977+9Me+/vQ==?=
 =?UTF-8?B?77+977+977+9amdyb3NzQHN1c2UuY29tPiA8NUJGQkQxQzYwMjAwMDA3ODAwMUZG?=
 =?UTF-8?B?RTA5QHN1c2UuY29tPiA8ZDM4YjFjMzPvv701Y2Nh77+9NTcyYe+/vWE5NDLvv71i?=
 =?UTF-8?Q?1db8ca309a2=40suse=2ecom=3e_=3c5BFBFCD3020000780020004F=40suse=2e?=
 =?UTF-8?Q?com=3e_=3c955bec0d-f574-53c5-91a5-1d6ea0bc4f2a=40suse=2ecom=3e_?=
 =?UTF-8?Q?=3c5BFC0A1302000078002000E1=40suse=2ecom=3e_=3c06592737-411f-d518?=
 =?UTF-8?Q?-d972-6b4cdc704d9b=40suse=2ecom=3e_=3c4c7158b4-d4da-994e-545b-8f5?=
 =?UTF-8?Q?dec97dbb6=40arm=2ecom=3e_=3c2b040ede-2103-b93c-c005-5ff39ae21c4c?=
 =?UTF-8?Q?=40suse=2ecom=3e_=3c1d49ab74-9aaf-d3e4-9e19-ecba83c247c1=40arm=2e?=
 =?UTF-8?Q?com=3e_=3c7c650150-e836-bbcf-4a2b-fe077620c747=40suse=2ecom=3e_?=
 =?UTF-8?Q?=3ce458293e-2208-b56b-2397-3897d2363534=40arm=2ecom=3e?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMDoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEx
LzI3LzE4IDc6MzQgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI2LzExLzIwMTggMTc6
NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMjYvMTEvMjAxOCAxNjoxNywg
SnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBPbiAyNi8xMS8yMDE4IDE3OjAxLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDI2LzExLzIwMTggMTU6MjksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBPbiAyNi8xMS8yMDE4IDE1OjU4LCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4+PiBPbiAyNi4xMS4xOCBhdCAxNToyMywgPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6Cj4+Pj4+Pj4+IE9uIDI2LzExLzIwMTggMTU6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4+Pj4+Pj4gT24gMjYuMTEuMTggYXQgMTQ6NTIsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+
Pj4gU2Vjb25kbHksIHlvdSBhcmUgaW50cm9kdWNpbmcgYW4gQUJJIGNoYW5nZSB3aXRob3V0IGV4
cGxpY2l0bHkgdGVsbGluZwo+Pj4gaXQuIFRoaXMgc2hvdWxkIGJlIGNsYXJpZmllZCBpbiB0aGUg
cHVibGljIGludGVyZmFjZSBhbmQgcHJvYmFibHkgdGhlCj4+PiBtdWx0aWNhbGwgY29kZSB0byBh
dm9pZCByZS1pbnRyb2R1Y2luZyB0aGUgY2xvYmJlcmluZyBpbiB0aGUgZnV0dXJlLgo+Pgo+PiBO
bywgSSBkb24ndCB0aGluayBJJ20gaW50cm9kdWNpbmcgYW4gQUJJIGNoYW5nZS4gVGhlcmUgaXMg
bm8gZ3VhcmFudGVlCj4+IFhlbiB3aWxsIGNsb2JiZXIgYWxsIG11bHRpY2FsbCBhcmd1bWVudHMu
IEluIGZhY3QgYSBOREVCVUcgaHlwZXJ2aXNvcgo+PiBuZXZlciBkb2VzLiBUaGUgZ3Vlc3QgbXVz
dCBub3QgcmVseSBvbiBub24tY2xvYmJlcmVkIHZhbHVlcywgb2YgY291cnNlLgo+IAo+IFRoZSBs
YXN0IHNlbnRlbmNlIGlzIHdoYXQgdGhlIEFCSSBwcm9taXNlcyB5b3UuIFRoZSByZXN0IGlzIGEK
PiBpbXBsZW1lbnRhdGlvbiBkZWNpc2lvbiB0byBhdm9pZCBwZXJmb3JtYW5jZSBpbXBhY3QuCj4g
Cj4gSWYgeW91IGRvbid0IGNoYW5nZSB0aGUgQUJJLCB0aGVuIGhvdyB0aGUgZ3Vlc3Qgd2lsbCBi
ZSBhYmxlIHRvIGtub3cgdGhlCj4gdmFsdWVzIGFyZSBjb3JyZWN0PyBGdXJ0aGVybW9yZSwgYXMg
eW91ciBjaGFuZ2UgYXJlIG5vdCBkb2N1bWVudGVkIGhvdwo+IGRvIHlvdSBndWFyYW50ZWUgdGhh
dCB0aGlzIHdpbGwgbm90IGJlIHJldmVydGVkIGluIHRoZSBmdXR1cmU/CgpUaGlzIGlzIGZvciBk
aWFnbm9zdGljIHB1cnBvc2Ugb25seS4gQ29tbW9uIHNlbnNlIHNob3VsZCBiZSBhcHBsaWVkIHdo
ZW4KaW50ZXJwcmV0aW5nIHRoZSBwcmludGVkIGRhdGEsIGxpa2UgZS5nLiBpbiBjYXNlIG9mIGEg
c3RhY2sgYmFja3RyYWNlLgoKVGhlIGd1ZXN0IGRvZXNuJ3QgaGF2ZSB0byBrbm93IChhbmQgc2hv
dWxkbid0KSB3aGV0aGVyIHRoZSBkYXRhIGlzCmNsb2JiZXJlZCBvciBub3QuIFRoZSBwZXJzb24g
dHJ5aW5nIHRvIGxvY2F0ZSBhIGJ1ZyBpbiB0aGUgZ3Vlc3Qgd2lsbCBiZQptb3JlIGNhcGFibGUg
dG8gZG8gc28gaW4gY2FzZSBhdCBsZWFzdCBzb21lIG9mIHRoZSBhZGRpdGlvbmFsIGRhdGEgaXNu
J3QKY2xvYmJlcmVkLiBUaGF0J3MgdGhlIHJlYXNvbiBmb3IgdGhlIHBhdGNoLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
