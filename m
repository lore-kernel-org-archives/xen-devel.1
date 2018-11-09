From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH v2 01/21] xen/arm: traps: Constify show_*,
 do_unexpected_trap and do_bug_frame parameters
Date: Fri, 9 Nov 2018 13:40:26 +0000
Message-ID: <VI1PR0302MB26888F920124CE7DC615617DE6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
References: <20181031181313.8028-1-julien.grall@arm.com>,
 <20181031181313.8028-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181031181313.8028-2-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Andrii Anisov <andrii.anisov@gmail.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZA
ZXBhbS5jb20+Cgpwcy4gcGxlYXNlIHJlYWNoIG1lIGJ5IG15IGdtYWlsIGFuZHJpaS5hbmlzb3ZA
Z21haWwuY29tIGZ1cnRoZXIsIHJhdGhlciB0aGFuIGVwYW0ncyBlbWFpbC4KT3VyIGluZnJhIGVu
YWJsZWQgMi1mYWN0b3IgYXV0aCwgYW5kIEkgZGlkbid0IG1hbmFnZSB0byBtYWtlIHRodW5kZXJi
aXJkIGZ1bmN0aW9uYWwgYW55IG1vcmUuIEFuZCBvdXRsb29rJ3Mgd2ViIGludGVyZmFjZSBpcyBu
ZWFybHkgdW51c2FibGUuCiAgCiAKQU5EUklJIEFOSVNPVgoKCiAgICAgCgoKCgogICAgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
