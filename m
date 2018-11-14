From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 4/5] xen/domain: Allocate d->vcpu[]
 earlier during domain_create()
Date: Wed, 14 Nov 2018 19:37:09 +0000
Message-ID: <d20b3a40-78eb-a41c-9ac2-8810d49baf95@arm.com>
References: <017c35d6-689c-b025-6a05-4188a2150332@citrix.com>
 <1542224160-6130-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542224160-6130-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC8xMS8yMDE4IDE5OjM2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ICsgICAgLyogbWF4
X3ZjcHVzIGRlcGVuZHMgb24gdGhlIEdJQyB2ZXJzaW9uLCBhbmQgWGVuJ3MgY29tcGlsZWQgbGlt
aXQuICovCj4gKyAgICBtYXhfdmNwdXMgPSBtYXgodmdpY19tYXhfdmNwdXMoY29uZmlnLT5hcmNo
LmdpY192ZXJzaW9uKSwgTUFYX1ZJUlRfQ1BVUyk7CgpEaWQgeW91IG1lYW4gbWluKHZnaWMsIE1B
WF9WSVJUX0NQVVMpPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
