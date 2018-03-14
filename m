From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Wed, 14 Mar 2018 18:34:12 +0000
Message-ID: <fe36c56d-d88a-ed9d-8e89-6bccca4304e6@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-9-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTg6MjAsIGp1bGllbi5ncmFsbEBhcm0uY29tIHdyb3RlOgo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiBUaGUgZnVuY3Rpb24gcG9wdWxh
dGVfcHRfcmFuZ2UgaXMgdXNlZCB0byBwb3B1bGF0ZSBpbiBhZHZhbmNlIHRoZQo+IHBhZ2UtdGFi
bGUgYnV0IGl0IHdpbGwgbm90IGRvIHRoZSBhY3R1YWwgbWFwcGluZy4gU28gcGFzc2luZyB0aGUg
TUZOIGluCj4gcGFyYW1ldGVyIGlzIHBvaW50bGVzcy4gTm90ZSB0aGF0IHRoZSBvbmx5IGNhbGxl
ciBwYXNzIDAuLi4KPgo+IEF0IHRoZSBzYW1lIHRpbWUgcmVwbGFjZSAwIGJ5IElOVkFMSURfTUZO
cy4gV2hpbGUgdGhpcyBkb2VzIG5vdCBtYXR0ZXIKPiBhcyB0aGUgZW50cnkgd2lsbCBtYXJrZWQg
YXMgbm90IHZhbGlkIGFuZCBwb3B1bGF0ZWQsIElOVkFMSURfTUZOCj4gaGVscHMgdGhlIHJlYWRl
ciB0byBrbm93IHRoZSBNRk4gaXMgaW52YWxpZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
