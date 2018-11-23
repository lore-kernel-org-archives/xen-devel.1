From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/14] AMD/IOMMU: Fix multiple reference
 counting errors
Date: Fri, 23 Nov 2018 16:03:29 +0000
Message-ID: <764100c1-dd77-b7a0-4588-d06e1ab63cb8@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-4-git-send-email-andrew.cooper3@citrix.com>
 <5BF6C27902000078001FEF9D@prv1-mh.provo.novell.com>
 <6e804647-5e9a-4d41-c441-1317b418e4dc@citrix.com>
 <5BF7B8F202000078001FF37E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BF7B8F202000078001FF37E@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAwODoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMTEuMTgg
YXQgMTg6NDYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjIvMTEv
MjAxOCAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQEAgLTIyMCwxMiArMjE5LDE4IEBA
IHZvaWQgZ3Vlc3RfaW9tbXVfYWRkX3Bwcl9sb2coc3RydWN0IGRvbWFpbiAqZCwgdTMyIGVudHJ5
W10pCj4+Pj4gICAgICB1bm1hcF9kb21haW5fcGFnZShsb2dfYmFzZSk7Cj4+Pj4gIAo+Pj4+ICAg
ICAgZ3Vlc3RfaW9tbXVfZGVsaXZlcl9tc2koZCk7Cj4+Pj4gKwo+Pj4+ICtvdXQ6Cj4+PiBQbGVh
c2UgaW5kZW50IGJ5IGF0IGxlYXN0IG9uZSBibGFuayAoc2FtZSBmdXJ0aGVyIGRvd24pLgo+PiBJ
IHRob3VnaHQgeW91J3ZlIHNhaWQgdGhhdCB5b3UncmUgbm8gbG9uZ2VyIHVzaW5nIGFuIG9ic29s
ZXRlIHZlcnNpb24gb2YKPj4gZGlmZi4KPiBJIGRvbid0IHRoaW5rIEkndmUgZXZlciBzYWlkIHNv
LCBhbmQgSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIG11Y2ggd2hhdAo+IEkgcGVyc29uYWxseSB1
c2UuCgpUaGUgb25seSByZWFzb24gd2UgaGF2ZSB0aGlzIHF1aXJrIG9mIGEgY29kaW5nIHN0eWxl
IGlzIGJlY2F1c2UgeW91Cmluc2lzdGVkIHdoZW4gRGF2aWQgd2FzIHB1dHRpbmcgdG9nZXRoZXIg
Q09ESU5HX1NUWUxFLCBhbmQgdGhlIHJlYXNvbgp5b3UgZ2F2ZSB3YXMgdG8gd29yayBhcm91bmQg
dmVyc2lvbnMgb2YgYGRpZmYgLXVgIHdoaWNoIG1pc3Rvb2sgdGhlIGNhc2UKbGFiZWwgZm9yIHRo
ZSBmdW5jdGlvbiBuYW1lIHdoZW4gY3JlYXRpbmcgdGhlIHVuaWZpZWQgaGVhZGVyLsKgIHYxIG9m
CkRhdmlkJ3MgcGF0Y2ggdmVyeSBzcGVjaWZpY2FsbHkgZGlkbid0IGhhdmUgdGhlIG9uZSBzcGFj
ZSwgYmVjYXVzZSBoZQp3YXMgYWN0dWFsbHkgdHJ5aW5nIHRvIGdldCByaWQgb2YgdGhhdCwgYXMg
aXQgd2FzIChhbmQgc3RpbGwgaXMpCmNvbXBsZXRlbHkgdW5leHBlY3RlZCBmb3IgbmV3IGRldmVs
b3BlcnMsIGFuZCBhIGZyZXF1ZW50IHNvdXJjZSBvZiBjdXJ0CnJldmlldyByZXNwb25zZXMuCgpJ
ZiB0aGlzIGlzIG5vIGxvbmdlciBhIGNvbmNlcm4sIGNhbiBJIHN1Z2dlc3Qgd2UgdXBkYXRlIENP
RElOR19TVFlMRS7CoApUaGlzIGlzIG9uZSBwYXJ0aWN1bGFyIGRpdmVyZ2VuY2UgZnJvbSBtb3Jl
IG5vcm1hbCBzdHlsZXMgd2hpY2ggZG9lc24ndAphZGQgdG8gY29kZSBjbGFyaXR5IGluIGFueSB3
YXkgSSBjYW4gc3BvdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
