From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/spec_ctrl: Fix several bugs in
 SPEC_CTRL_ENTRY_FROM_INTR_IST
Date: Wed, 14 Feb 2018 11:50:53 +0000
Message-ID: <7bdc1c16-0067-508b-d84b-35993b8092a6@citrix.com>
References: <1518606655-787-1-git-send-email-andrew.cooper3@citrix.com>
 <20180214114715.nnjhmi7fnzqro5jy@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180214114715.nnjhmi7fnzqro5jy@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMTggMTE6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4KPj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsX2FzbS5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9zcGVjX2N0cmxfYXNtLmgKPj4gaW5kZXggODE0ZjUzZC4uMWY3ODU5OSAxMDA2NDQKPj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zcGVjX2N0cmxfYXNtLmgKPj4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zcGVjX2N0cmxfYXNtLmgKPj4gQEAgLTc5LDEwICs3OSwxMCBAQAo+PiAg
ICogIC0gU1BFQ19DVFJMX0VYSVRfVE9fR1VFU1QKPj4gICAqLwo+PiAgCj4+IC0ubWFjcm8gRE9f
T1ZFUldSSVRFX1JTQgo+PiArLm1hY3JvIERPX09WRVJXUklURV9SU0IgdG1wPSVyYXgKPj4gIC8q
Cj4+ICAgKiBSZXF1aXJlcyBub3RoaW5nCj4+IC0gKiBDbG9iYmVycyAlcmF4LCAlcmN4Cj4+ICsg
KiBDbG9iYmVycyBcdG1wICglcmF4IGJ5IGRlZmF1bHQpLCAlcmN4Cj4gSXMgaXQgd29ydGggY2hh
bmdpbmcgJXJjeCB0byAlZWN4IGhlcmUuLi4KCk5vLCBiZWNhdXNlIGEgbW92IHRvICVlY3ggY2xv
YmJlcnMgJXJjeC7CoCBJJ2xsIGFkanVzdCB0aGUgY29tbWVudC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
