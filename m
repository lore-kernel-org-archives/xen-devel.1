From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86: Consolidate the storage of
 MSR_AMD64_DR{0-3}_ADDRESS_MASK
Date: Fri, 19 Oct 2018 18:52:02 -0400
Message-ID: <f864baa1-c151-4437-ebf4-c0ada29b147b@oracle.com>
References: <1539962062-9406-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539962062-9406-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTkvMTggMTE6MTQgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21zci5oCj4g
aW5kZXggN2EwNjFiMi4uYzFjYjM4ZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L21zci5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaAo+IEBAIC0yODcsNiArMjg3
LDEyIEBAIHN0cnVjdCB2Y3B1X21zcnMKPiAgICAgICAgICAgICAgYm9vbCBjcHVpZF9mYXVsdGlu
ZzoxOwo+ICAgICAgICAgIH07Cj4gICAgICB9IG1pc2NfZmVhdHVyZXNfZW5hYmxlczsKPiArCj4g
KyAgICAvKgo+ICsgICAgICogMHhjMDAxMTB7MjcsMTktMWJ9IE1TUl9BTUQ2NF9EUnswLTN9X0FE
RFJFU1NfTUFTSwo+ICsgICAgICogVE9ETzogTm90IHlldCBoYW5kbGVkIGJ5IGd1ZXN0X3tyZCx3
cn1tc3IoKSBpbmZyYXN0cnVjdHVyZS4KPiArICAgICAqLwo+ICsgICAgdWludDMyX3QgZHJfbWFz
a1s0XTsKPiAgfTsKPiAgCgpZb3UgZG9uJ3QgdGhpbmsgd3JhcHBpbmcgdGhlc2UgaW50byBhbiBp
bnRlbC9hbWQgdW5pb24gd291bGQgYmUgdXNlZnVsPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
