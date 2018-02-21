From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/2] x86/svm: add pause filtering threshold
	for SVM
Date: Wed, 21 Feb 2018 18:30:43 -0500
Message-ID: <a991b7bb-5b9f-f2db-2254-e6556ab1c86c@oracle.com>
References: <20180221001233.62644-1-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221001233.62644-1-brian.woods@amd.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjAvMjAxOCAwNzoxMiBQTSwgQnJpYW4gV29vZHMgd3JvdGU6Cj4gVGhpcyBwYXRjaCBz
ZXJpZXMgYWRkcyBzdXBwb3J0IGFuZCBlbmFibGVtZW50IG9mIHRoZSBwYXVzZSBmaWx0ZXJpbmcK
PiB0aHJlc2hvbGQuICBPbmNlIHRoZXJlJ3MgcGF1c2UgZmlsdGVyaW5nIHRocmVzaG9sZCBhbW91
bnQgb2YgY3ljbGVzCj4gYmV0d2VlbiBwYXVzZXMsIHRoZSBwYXVzZSBmaWx0ZXJpbmcgY291bnRl
ciByZXNldHMgdG8gd2hhdCB3YXMgaW4gdGhlCj4gVk1DQi4gIFRoaXMgYWxsb3dzIHRoZSBwYXVz
ZSBmaWx0ZXJpbmcgY291bnQgdG8gInJlc2V0IiBiZXR3ZWVuIHBhdXNlcwo+IGFuZCBrZWVwcyB0
aGUgZ3VzZXQgZnJvbSBnZXR0aW5nIGludGVyY2VwdGVkIGJ5IHRoZSBoeXBlcnZpc29yLiAgU2Vl
IEFNRAo+IEFQTSB2b2wgMiBzZWN0aW9uIDE1LjE0LjQgZm9yIG1vcmUgZGV0YWlscy4KPgo+IElu
IHJlcGx5IHRvIHRoaXMgd2lsbCBiZSBhbiBlbWFpbCB3aXRoIGdyYXBocyBzaG93aW5nIHNvbWUg
YmVuY2htYXJrCj4gcmVzdWx0cyBvZiB3aHkgdGhlIHZhbHVlcyBvZiB0aGUgY291bnRlciBhbmQg
dGhyZXNob2xkIHdlcmUgcGlja2VkLgo+Cj4gQnJpYW4gV29vZHMgKDIpOgo+ICAgeDg2L3N2bTog
YWRkIHN1cHBvcnQgZm9yIHBhdXNlIGZpbHRlcmluZyB0aHJlc2hvbGQKPiAgIHg4Ni9zdm06IGVu
YWJsZSBwYXVzZSBmaWx0ZXJpbmcgdGhyZXNob2xkCj4KPiAgeGVuL2FyY2gveDg2L2h2bS9zdm0v
c3ZtLmMgICAgICAgICB8IDEgKwo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMgICAgICAg
IHwgMyArKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bS5oICB8IDUgKysrKy0K
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaCB8IDMgKystCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgoKSUlSQyBwcmV2aW91
cyBjb3VudCB2YWx1ZSAgKDMwMDApIHdhcyBzb21ld2hhdCBhcmJpdHJhcnkgc28KClJldmlld2Vk
LWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
