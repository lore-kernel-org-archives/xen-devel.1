From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 11/16] xen/mm: Switch some of
 page_alloc.c to typesafe MFN
Date: Thu, 15 Mar 2018 18:07:08 +0000
Message-ID: <cdf8577b-921b-db8c-0b5e-4662c803982c@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-12-julien.grall@arm.com>
 <47029b9d-b31d-2364-afdc-d6969d0fb287@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <47029b9d-b31d-2364-afdc-d6969d0fb287@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKT24gMTUvMDMvMTggMTc6MDIs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMDMvMTQvMjAxOCAwNjoyMCBQTSwganVsaWVuLmdy
YWxsQGFybS5jb20gd3JvdGU6Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGlzIHBhdGNoIGJ5IGl0c2Vs
ZiBkb2Vzbid0IGxvb2sgbGlrZSBpdCBhY3R1YWxseSBtYWtlcyB0aGluZ3Mgc2ltcGxlcgo+IGlu
IGdlbmVyYWwsIGJ1dCBJJ2xsIHRydXN0IHRoYXQgaXQgd2lsbCBpbiB0aGUgZnV0dXJlOgoKSSB0
aGluayBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBkbyBmdXJ0aGVyIGNsZWFuLXVwLiBXaGF0IEkg
d2FudGVkIHRvIAphdm9pZCBpcyBoYXZpbmcgbWZuX3gocGFnZV90b19tZm4ocGcpKSBhbGwgYXJv
dW5kIHRoZSBjb2RlIGFmdGVyIHBhZ2UgCiMxNiBiZWNhdXNlIHRoZSBvdmVycmlkZSBpcyBkcm9w
cGVkLgoKPiAKPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
