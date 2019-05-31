From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] vm_event: Remove "ring" suffix from
 vm_event_check_ring
Date: Fri, 31 May 2019 16:32:24 -0700
Message-ID: <c2d6c522-7c70-bcce-8d3a-d919227e0c3b@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9e731967741fac6046a3a862964ac61ba7cababc.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWr0m-0003dy-PJ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 23:32:36 +0000
In-Reply-To: <9e731967741fac6046a3a862964ac61ba7cababc.1559224640.git.ppircalabu@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAwNzoxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKPiBpbmRleCAz
NTA1NTg5Li4xZGQzZTQ4IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vdm1fZXZlbnQuYwo+ICsr
KyBiL3hlbi9jb21tb24vdm1fZXZlbnQuYwo+IEBAIC0yNzcsNyArMjc3LDcgQEAgdm9pZCB2bV9l
dmVudF9wdXRfcmVxdWVzdChzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgUklOR19JRFggcmVxX3By
b2Q7Cj4gICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4gIAo+IC0gICAgaWYoICF2
bV9ldmVudF9jaGVja19yaW5nKHZlZCkpCj4gKyAgICBpZiggIXZtX2V2ZW50X2NoZWNrKHZlZCkp
CgpJZGVhbGx5IHdpdGggZml4aW5nIHVwIHRoaXMgc3R5bGUgZXJyb3IsIGFzIHlvdSdyZSBjaGFu
Z2luZyB0aGUgbGluZS7CoApUaGlzIGNhbiBiZSBmaXhlZCBvbiBjb21taXQuCgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
