From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/balloon: Mark unallocated host memory
	as UNUSABLE
Date: Fri, 15 Dec 2017 15:47:19 +0100
Message-ID: <1385e130-7300-66a4-3995-838244600746__39729.8357020647$1513349297$gmane$org@suse.com>
References: <1513119066-10748-1-git-send-email-boris.ostrovsky@oracle.com>
 <14852f9f-f234-3226-f32b-3080ca114332@suse.com>
 <a8495745-b56a-83ff-993f-a745c8edf2c0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a8495745-b56a-83ff-993f-a745c8edf2c0@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xen.org, linux-kernel@vger.kernel.org
Cc: helgaas@kernel.org, christian.koenig@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTIvMTcgMTU6MjQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiAKPj4+ICsKPj4+ICsJ
aG9zdG1lbV9yZXNvdXJjZS0+c3RhcnQgPSBtYXhfYWRkcjsKPj4+ICsJaG9zdG1lbV9yZXNvdXJj
ZS0+ZW5kID0gZW50cnktPmFkZHIgKyBlbnRyeS0+c2l6ZTsKPj4+ICsJZm9yICg7IGkgPCBtZW1t
YXAubnJfZW50cmllczsgaSsrKSB7Cj4+PiArCQllbnRyeSA9ICZ4ZW5fZTgyMF90YWJsZS0+ZW50
cmllc1tpXTsKPj4+ICsJCWlmIChlbnRyeS0+dHlwZSA9PSBFODIwX1RZUEVfUkFNKQo+PiBTaG91
bGRuJ3QgdGhhdCBiZSAhPSA/Cj4gCj4gTm8sIHRoZSBpZGVhIGhlcmUgaXMgdG8gcG9wdWxhdGUg
aG9zdG1lbV9yZXNvdXJjZSB3aXRoIHJhbmdlcyBhbHJlYWR5Cj4gdGFrZW4gYnkgdGhpbmdzIG90
aGVyIHRoYW4gUkFNLCBsZWF2aW5nIG1lbW9yeSByZWdpb25zIGFzIGF2YWlsYWJsZSBmb3IKPiB0
aGUgYmFsbG9vbiBob3RwbHVnLiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gdXNlIGFsbG9jYXRlX3Jl
c291cmNlKCksCj4gd2hpY2ggc2VhcmNoZXMgZm9yIGEgZnJlZSByYW5nZSwgaW4gdGhlIGJhbGxv
b24gZHJpdmVyLgoKQnV0IHdoeSBzYXlzIHRoZSBjb21tZW50ICJIb3N0IG1lbW9yeSBub3QgYWxs
b2NhdGVkIHRvIGRvbTAiIHRoZW4/CkFuZCB3aHkgYXJlIHlvdSB0cnlpbmcgdG8gYWxsb2NhdGUg
ZnJvbSB0aGlzIHJlc291cmNlIGluIGNhc2Ugb2YKaG90cGx1Z2dpbmcgbWVtb3J5IChhbmQgZmFs
bCBiYWNrIHRvIGlvbWVtX3Jlc291cmNlIGluIGNhc2Ugb2YKZmFpbHVyZSk/CgpFaXRoZXIgdGhl
IGNvbW1lbnQgaXMgY29tcGxldGVseSB3cm9uZyBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHRoZQps
b2dpYyBoZXJlLCBvciB5b3VyIGNvZGUgaXMgd3JvbmcuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
