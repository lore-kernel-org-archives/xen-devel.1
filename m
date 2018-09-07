From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/6] xen/sched: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Fri, 7 Sep 2018 15:42:16 +0100
Message-ID: <59448616-97e5-3fc4-5b56-1b14ec9c3875@citrix.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
 <5B9230E702000078001E62FC@prv1-mh.provo.novell.com>
 <72e89500-dcfc-7d61-cc2f-c5b9401ebfe5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <72e89500-dcfc-7d61-cc2f-c5b9401ebfe5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDcvMjAxOCAwMjo1NiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlbiBhZ2Fp
biBJIHdvbmRlciB3aGV0aGVyIGEgc3BlY2lhbAo+PiBjYXNlIGZvciBDUFUgbWFza3Mgd291bGRu
J3QgYmUgd2FycmFudGVkLCBtYWtpbmcgaXQgdW5uZWNlc3NhcnkgZm9yCj4+IGNhbGxlcnMgdG8g
cGFzcyBpbiBucl9jcHVfaWRzIGV4cGxpY2l0bHkuCj4gCj4gVGhlIG9ubHkgd2F5IG9mIHNwZWNp
YWwgY2FzaW5nIGlzIHRvIGhhdmUgYSBkaWZmZXJlbnQgY3VzdG9tICVwCj4gZm9ybWF0dGVyLsKg
IEFsbCBwcmludGluZyBvZiBjcHUgYW5kIG5vZGVtYXNrcyBhcmUgaW4ga2V5aGFuZGxlcnMgc28g
SQo+IGRvbid0IHRoaW5rIGEgY3VzdG9tIGNhc2UgaXMgZ29pbmcgdG8gYmUgd29ydGggaXQuCgpJ
IHdvdWxkbid0IGhhdmUgYW4gb2JqZWN0aW9uIHRvIHNvbWVvbmUgaW1wbGVtZW50aW5nIGEgY3B1
bWFzay1zcGVjaWZpYwpmb3JtYXR0ZXIgYXQgc29tZSBwb2ludCwgYnV0IEkgZG9uJ3QgdGhpbmsg
QW5keSBzaG91bGQgYmUgcmVxdWlyZWQgdG8Kd3JpdGUgaXQuCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
