From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Fri, 16 Nov 2018 11:44:09 +0000
Message-ID: <dc9b6382-490e-fd41-6fec-faf211103cee@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
 <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
 <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8xMS8yMDE4IDExOjI5LCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+IE9uIEZyaSwg
Tm92IDE2LCAyMDE4IGF0IDExOjMzIEFNIE1pcmVsYSBTaW1vbm92aWMKPiA8bWlyZWxhLnNpbW9u
b3ZpY0BhZ2dpb3MuY29tPiB3cm90ZToKPj4KPj4gSGkgSnVsaWVuLAo+Pgo+PiBPbiBUaHUsIE5v
diAxNSwgMjAxOCBhdCA5OjMxIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4KPj4+IE9uIDExLzEyLzE4IDExOjMwIEFNLCBNaXJlbGEg
U2ltb25vdmljIHdyb3RlOgo+Pj4+IFRoZSByZXN1bWUgb2YgRG9tMCBzaG91bGQgYWx3YXlzIGZv
bGxvdyBYZW4ncyByZXN1bWUuIFRoaXMgaXMKPj4+PiBkb25lIGJ5IHVuYmxvY2tpbmcgdGhlIGZp
cnN0IHZDUFUgb2YgRG9tMC4KPj4+Cj4+PiBQbGVhc2UgZXhwbGFpbiB3aHkgeW91IGFsd2F5cyBu
ZWVkIHRvIHJlc3VtZSBEb20wIGFmdGVyd2FyZHMuCj4+Pgo+Pgo+PiBXZSBkb24ndCBuZWVkIHRv
LCBidXQgdGhhdCBpcyB3aGF0IGlzIHByb21pc2VkIGluIHRoZSBkZXNpZ24gc3BlYy4KCllvdSBz
dXJlbHkgaGFkIHNvbWUgcmF0aW9uYWxlIHdoZW4gd3JpdGluZyB0aGUgcHJvbWlzZSBpbiB0aGUg
ZGVzaWduIGRvY3VtZW50LCAKcmlnaHQ/CgpTbyB3aGF0IGlzIHRoZSByZWFzb24gYmVoaW5kIGl0
PyBJIGRvbid0IHdhbnQgdG8gcmVzdW1lIGEgZG9tYWluIGlmIHRoYXQncyBub3QgCm5lY2Vzc2Fy
eS4KCj4+Cj4gCj4gVG8gYmUgbW9yZSBzcGVjaWZpYyAtIGEgZG9tVSB0aGF0IGRvZXNuJ3QgZGVw
ZW5kIG9uIGRvbTAgY2FuIHJlc3VtZQo+IGFuZCB3b3JrIGhhcHBpbHkgd2l0aG91dCBkb20wIGJl
aW5nIHJlc3VtZWQsIGkuZS4ganVzdCBYZW4gYW5kIGRvbVUKPiByZXN1bWUuIFNvIHBhdGNoICJb
UEFUQ0ggMTcvMThdIHhlbi9hcm06IFJlc3VtZSBEb20wIGFmdGVyIFhlbgo+IHJlc3VtZXMiIGlz
IG5vdCBhIG11c3QgKHdoZW4gdGhlcmUgYXJlIG5vIFBWIGRyaXZlcnMgaW52b2x2ZWQpLgoKUFYg
YmFja2VuZHMgZG9uJ3QgbmVjZXNzYXJpbHkgcmVzaWRlIGluIHRoZSBoYXJkd2FyZSBkb21haW4u
IFNvIGhvdyBpcyB0aGlzIApnb2luZyB0byB3b3JrIGZvciB0aGUgb3RoZXIgY2FzZT8KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
