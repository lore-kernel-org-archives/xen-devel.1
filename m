From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v19 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Tue, 3 Apr 2018 15:08:29 +0100
Message-ID: <ef33cb19-0b77-6434-7d0b-916a7da5f3d8@arm.com>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifgk=gy=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f3Mby-0000yk-Ra
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 14:08:34 +0000
In-Reply-To: <20180329153616.2929-7-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDI5LzAzLzE4IDE2OjM2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0u
aAo+IGluZGV4IGEwZTkyMmYzNjAuLjhjZGRmNDg0ZDggMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gQEAgLTM3
NCw2ICszNzQsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1dF9wYWdlX2FuZF90eXBlKHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2UpCj4gICAKPiAgIHZvaWQgY2xlYXJfYW5kX2NsZWFuX3BhZ2Uoc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZSk7Cj4gICAKPiArc3RhdGljIGlubGluZSBpbnQgYXJjaF9hY3F1
aXJlX3Jlc291cmNlKAoKSSB3b3VsZCBtdWNoIHByZWZlciB0byBzZWUgInN0YXRpYyBpbmxpbmUi
IG9uIGEgc2VwYXJhdGUgbGluZSBhbmQgZ2V0IAp0aGUgcGFyYW1ldGVycyBjb3JyZWN0bHkgaW5k
ZW50ZWQuCgpXaXRoIHRoYXQ6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
