From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/svm: Fixes to nested-svm MSR handing
Date: Mon, 10 Dec 2018 16:04:57 -0500
Message-ID: <6a8463ff-7f32-8539-a932-00192efddba1@oracle.com>
References: <1544442722-22245-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544442722-22245-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggNjo1MiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgaW50ZW50aW9u
IG9mIHRoaXMgcGF0Y2ggd2FzIHRvIHJlbW92ZSB0aGUgY2FsbHMgdG8gbnN2bV97cmQsd3J9bXNy
KCkgZnJvbQo+IHRoZSBkZWZhdWx0IGNhc2VzIG9mIHN2bV9tc3Jfe3JlYWQsd3JpdGV9X2ludGVy
Y2VwdCgpLCBidXQgaXQgaGFzIHR1cm5lZCBpbnRvCj4gYSBtb3JlIGNvcnJlY3RpdmUgcGF0Y2gg
dGhhbiBqdXN0IGNvZGUgbW90aW9uLgo+Cj4gRmlyc3QsIGNvbGxlY3QgdGhlIFZNX0NSIGJpdCBk
ZWZpbml0aW9ucyBuZXh0IHRvIHRoZSBtYWluIGRlZmluZSwgYW5kIHNpbXBsaWZ5Cj4gdGhlIG5h
bWluZy4gIFRoZSBTVk0gTVNScyBzaG91bGQgYmUgZW50aXJlbHkgdW5hdmFpbGFibGUgd2hlbiBT
Vk0gaXNuJ3QKPiBlbnVtZXJhdGVkIGluIENQVUlELgo+Cj4gV2hlbiBTVk0gaXMgYXZhaWxhYmxl
LCBYZW4gb25seSBzdXBwb3J0cyB0aGUgIkVuYWJsZWQiIG1vZGUgYXMgZGVzY3JpYmVkIGluCj4g
dGhlIEJLR0QvUFBScywgd2hpY2ggbWVhbnMgVk1fQ1IuTE9DSyBzaG91bGQgYmUgc2V0LiAgVGhp
cyBpbiB0dXJuIG1lYW5zIHRoZQo+IE1TUl9TVk1fTE9DS19LRVkgc2hvdWxkIGJlIGltcGxlbWVu
dGVkLiAgSXQgaXMgcmVhZC1hcy0wL3dyaXRlLWRpc2NhcmQgYXMgWGVuCj4gZG9lc24ndCBpbXBs
ZW1lbnQgdGhlICJkaXNhYmxlZCB3aXRoIHVzZXIgc3VwcGxpZWQga2V5IiBtb2RlLgoKV2hhdCBh
Ym91dCBiaXRzIDAtMj8gSSBhbSBub3Qgc3VyZSB3aGF0IGEgZ3Vlc3QgY2FuIGRvIHdpdGggdGhl
bSBidXQKdGhleSBhcmUgd3JpdGFibGUuCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
