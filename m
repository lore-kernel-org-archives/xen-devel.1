From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 09/50] x86emul: support AVX512{F,
 BW} integer unpack insns
Date: Mon, 20 May 2019 13:11:32 +0100
Message-ID: <3ffad362-eb39-e3c9-cd89-4ca969e9d710@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B813F020000780021F164@prv1-mh.provo.novell.com>
 <4b177bfd-0aa0-5389-b8d4-91278d8a0fc0@citrix.com>
 <5C8F6B05020000780021FC05@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSh8n-0002sV-MH
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 12:11:41 +0000
In-Reply-To: <5C8F6B05020000780021FC05@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDMvMjAxOSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDMuMTkg
YXQgMTk6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtNjY4MSw2ICs2NjgxLDEyIEBA
IHg4Nl9lbXVsYXRlKAo+Pj4gICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHhm
Nik6IC8qIHZwc2FkYncgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1tICovCj4+PiAgICAgICAg
ICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC5vcG1zaywgRVhDX1VEKTsKPj4+ICAgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZiwgMHg2MCk6IC8qIHZwdW5wY2tsYncgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
Cj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDYxKTogLyogdnB1bnBj
a2x3ZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KPj4+ICsgICAgY2FzZSBYODZF
TVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4NjgpOiAvKiB2cHVucGNraGJ3IFt4eXpdbW0vbWVtLFt4
eXpdbW0sW3h5el1tbXtrfSAqLwo+Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZiwgMHg2OSk6IC8qIHZwdW5wY2tod2QgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
Cj4+PiArICAgICAgICBvcF9ieXRlcyA9IDE2IDw8IGV2ZXgubHI7Cj4+PiArICAgICAgICAvKiBm
YWxsIHRocm91Z2ggKi8KPj4gSWYgdGhpcyBzZXR0aW5nIG9mIG9wX2J5dGVzIGlzIHNhZmUgdG8g
ZG8gZm9yIHZwc2FkYncsIGhvdyBkb2VzIHRoZQo+PiBlbXVsYXRpb24gY3VycmVudGx5IHdvcms/
Cj4gVGhlIHNldHRpbmcgaXMgcmVkdW5kYW50IGZvciBWUFNBREJXICh0aGVyZSBpdCBnZXRzIHNl
dCBieSB2aXJ0dWUKPiBvZiBpdHMgdGFibGUgZW50cnkgc2F5aW5nIHNpbWRfcGFja2VkX2ludCks
IGJ1dCBpdCdzIG5lY2Vzc2FyeSBmb3IKPiBWVU5QQ0sqIGFzIHRoZWlyIHRhYmxlIGVudHJpZXMg
dXNlIHNpbWRfb3RoZXIsIHdoaWNoIGlzIG5lY2Vzc2FyeQo+IGJlY2F1c2Ugb2YgdGhlIG1lbW9y
eSBhY2Nlc3MgcGF0dGVybiBvZiBQVU5QQ0tMKi4gSW4gZmFjdCB0aGUKPiBQVU5QQ0tIKiBlbnRy
aWVzIGNvdWxkIGVxdWFsbHkgd2VsbCB1c2Ugc2ltZF9wYWNrZWRfaW50LCBidXQKPiB0aGF0IHdv
dWxkIHRoZW4gY2FsbCBmb3IgdGhlaXIgY2FzZSBsYWJlbHMgdG8gZ2V0IG1vdmVkIGF3YXkgZnJv
bQo+IHRoZSBQVU5QQ0tMKiBvbmVzLCBhbmQgSSBzbGlnaHRseSBwcmVmZXIgdGhlbSB0byBiZSBr
ZXB0IHRvZ2V0aGVyLgoKT2suCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
