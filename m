From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] libxl: always call qemus
 xen-save-devices-state in suspend/resume
Date: Tue, 22 May 2018 12:14:29 +0100
Message-ID: <20180522111429.srz63nx6te2mefbt@citrix.com>
References: <20180517155108.4624-1-olaf@aepfle.de>
 <20180518170142.5q2773ivsfjt2b4y@citrix.com>
 <20180518210910.02c83631.olaf@aepfle.de>
 <20180521081820.2eue7occ26ouxzb3@citrix.com>
 <20180522105220.607f3f48.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180522105220.607f3f48.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjIsIDIwMTggYXQgMTA6NTI6MjBBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCAyMSBNYXkgMjAxOCAwOToxODoyMCArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBXaGF0IEkgbWVhbiBpczogbm93IHlvdSBz
ZWVtIHRvIHdhbnQgdG8gY2FsbAo+ID4gbGlieGxfX2RvbWFpbl9zdXNwZW5kX2RldmljZV9tb2Rl
bCB3aGVuIFFFTVUgdXBzdHJlYW0gaXMgcnVubmluZywKPiA+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhl
ciBhIGd1ZXN0IGlzIEhWTSBvciBQViwgc28gdGhlIGNoZWNrIGZvciBIVk0gc2hvdWxkCj4gPiBi
ZSBnb25lLgo+IAo+IGxpYnhsX19kb21haW5fc3VzcGVuZF9kZXZpY2VfbW9kZWwgY2FsbHMgbGli
eGxfX2RldmljZV9tb2RlbF92ZXJzaW9uX3J1bm5pbmcsCj4gd2hpY2ggbWF5IHJldHVybiBMSUJY
TF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05BTCBpbiBjYXNlCj4gImRt
LXZlcnNpb24iIGRvZXMgbm90IGV4aXN0Lgo+IElzIGl0IHZhbGlkIHRvIGFzc3VtZSB0aGF0IGEg
bm9uLWV4aXN0YW50ICJkbS12ZXJzaW9uIiBtZWFucyBxZW11LXRyYWQ/Cj4gU28gZmFyIEkgaGF2
ZSBub3QgdGVzdGVkIGEgUFYgZG9tVSB3aXRoIHFlbXUtdHJhZCwgbm90IHN1cmUgaWYgdGhhdCBj
YW4gd29yawo+IGFueXdheS4KPiAKPiBBbHNvLCBsaWJ4bF9fZGV2aWNlX21vZGVsX3ZlcnNpb25f
cnVubmluZyBtYXkgcmV0dXJuIC0xLiBJcyB0aGF0IHZhbGlkPwo+IAoKSSB0aGluayB5b3VyIHBy
ZWRpY2F0ZSBpcyBjb3JyZWN0LiBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
