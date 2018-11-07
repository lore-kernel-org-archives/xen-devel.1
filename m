From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v3] mm/page_alloc: make bootscrub happen in
 idle-loop
Date: Wed, 7 Nov 2018 16:36:08 +0000
Message-ID: <ecab96b1-c620-fe41-6843-a9a6e0d9a6cc@citrix.com>
References: <20181107111149.14842-1-sergey.dyasli@citrix.com>
 <20181107121714.q65fte6newwxcx2t@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181107121714.q65fte6newwxcx2t@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien.grall@arm.com>, "sergey.dyasli@citrix.com >> Sergey
 Dyasli" <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMjAxOCAxMjoxNywgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIE5vdiAwNywgMjAx
OCBhdCAxMToxMTo0OUFNICswMDAwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBTY3J1YmJpbmcg
UkFNIGR1cmluZyBib290IG1heSB0YWtlIGEgbG9uZyB0aW1lIG9uIG1hY2hpbmVzIHdpdGggbG90
cwo+PiBvZiBSQU0uIEFkZCAnaWRsZScgb3B0aW9uIHRvIGJvb3RzY3J1YiB3aGljaCBtYXJrcyBh
bGwgcGFnZXMgZGlydHkKPj4gaW5pdGlhbGx5IHNvIHRoZXkgd2lsbCBldmVudHVhbGx5IGJlIHNj
cnViYmVkIGluIGlkbGUtbG9vcCBvbiBldmVyeQo+PiBvbmxpbmUgQ1BVLgo+Pgo+PiBJdCdzIGd1
YXJhbnRlZWQgdGhhdCB0aGUgYWxsb2NhdG9yIHdpbGwgcmV0dXJuIHNjcnViYmVkIHBhZ2VzIGJ5
IGRvaW5nCj4+IGVhZ2VyIHNjcnViYmluZyBkdXJpbmcgYWxsb2NhdGlvbiAodW5sZXNzIE1FTUZf
bm9fc2NydWIgd2FzIHByb3ZpZGVkKS4KPj4KPj4gVXNlIHRoZSBuZXcgJ2lkbGUnIG9wdGlvbiBh
cyB0aGUgZGVmYXVsdCBvbmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNl
cmdleS5keWFzbGlAY2l0cml4LmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IHYyIC0tPiB2MzoKPj4gLSBSZW1vdmVkICI9IDAiIGZy
b20gZW51bSBib290c2NydWJfbW9kZQo+PiAtIFJlbW92ZWQgbnVtX29ubGluZV9ub2RlcygpIGZy
b20gcHJpbnRrKCkKPj4gLSBBZGRlZCBSZXZpZXdlZC1ieQo+IAo+IEkgdGhpbmsgeW91ciBwYXRj
aCAodjI/KSBpcyBhbHJlYWR5IGNvbW1pdHRlZC4KCkhtbSwgeW91IGFyZSByaWdodDogQ29tbWl0
RGF0ZTogV2VkIE5vdiA3IDA5OjM0OjE3IDIwMTggKzAxMDAKU29ycnksIEkgd2Fzbid0IGV4cGVj
dGluZyB0aGF0LgoKVGhvdWdoIHByaW50aygpIGluIHRoZSBjb21taXR0ZWQgdmVyc2lvbiBoYXMg
YSB0eXBvOgoKICAgIHByaW50aygiU2NydWJiaW5nIGZyZWUgUkFNIG9uIGluIGJhY2tncm91bmRc
biIpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl4KCi0tClRoYW5rcywKU2VyZ2V5
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
