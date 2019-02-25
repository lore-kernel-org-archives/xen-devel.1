From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: [PATCH 0/3]  mwait support for AMD processors
Date: Mon, 25 Feb 2019 20:23:57 +0000
Message-ID: <20190225202233.68340-1-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Woods, Brian" <Brian.Woods@amd.com>, Jan Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgYW5kIGVuYWJsZW1lbnQgZm9yIG13YWl0IG9u
IEFNRCBOYXBsZXMKYW5kIFJvbWUgcHJvY2Vzc29ycy4gIE5ld2VyIEFNRCBwcm9jZXNzb3JzIHN1
cHBvcnQgbXdhaXQsIGJ1dCBvbmx5IGZvcgpjMSwgYW5kIGZvciBjMiBoYWx0IGlzIHVzZWQuICBU
aGUgbXdhaXQtaWRsZSBkcml2ZXIgaXMgbW9kaWZpZWQgdG8gYmUKYWJsZSB0byB1c2UgYm90aCBt
d2FpdCBhbmQgaGFsdCBmb3IgaWRsaW5nLgoKQnJpYW4gV29vZHMgKDMpOgogIG13YWl0LWlkbGU6
IGFkZCBzdXBwb3J0IGZvciB1c2luZyBoYWx0CiAgbXdhaXQtaWRsZTogYWRkIHN1cHBvcnQgZm9y
IEFNRCBwcm9jZXNzb3JzCiAgbXdhaXQtaWRsZTogYWRkIGVuYWJsZW1lbnQgZm9yIEFNRCBOYXBs
ZXMgYW5kIFJvbWUKCiB4ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUuYyB8IDg3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3OCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
