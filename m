From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/blkfront: correct purging of persistent
 grants
Date: Fri, 28 Sep 2018 15:13:29 +0200
Message-ID: <772c3886-d4fe-b912-b125-a648b31a3074__1383.63879309527$1538140344$gmane$org@suse.com>
References: <20180928072827.14229-1-jgross@suse.com>
 <95e32835-426f-36c9-a86a-09563f090f22@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wnhr=mk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g5saL-0005pj-L9
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 13:13:33 +0000
In-Reply-To: <95e32835-426f-36c9-a86a-09563f090f22@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDkvMjAxOCAxNDo0NSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvMjgvMTgg
MzoyOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQ29tbWl0IGE0NmI1MzY3MmIyYzJlMzc3
MGIzOGE0YWJmOTBkMTYzNjRkMjU4NGIgKCJ4ZW4vYmxrZnJvbnQ6IGNsZWFudXAKPj4gc3RhbGUg
cGVyc2lzdGVudCBncmFudHMiKSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBhcyBwdXJnZWQgcGVy
c2lzdGVudAo+PiBncmFudHMgd2VyZSBub3QgcHUgaW50byB0aGUgbGlzdCBvZiBmcmVlIGdyYW50
cyBhZ2Fpbi4gQ29ycmVjdCB0aGF0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQu
YyB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9k
cml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+IGluZGV4IGE3MWQ4MTdlOTAwZC4uNDI5ZDIw
MTMxYzdlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+ICsr
KyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPj4gQEAgLTI2NzAsOCArMjY3MCw4IEBA
IHN0YXRpYyB2b2lkIHB1cmdlX3BlcnNpc3RlbnRfZ3JhbnRzKHN0cnVjdCBibGtmcm9udF9pbmZv
ICppbmZvKQo+PiAgCQkJbGlzdF9kZWwoJmdudF9saXN0X2VudHJ5LT5ub2RlKTsKPj4gIAkJCWdu
dHRhYl9lbmRfZm9yZWlnbl9hY2Nlc3MoZ250X2xpc3RfZW50cnktPmdyZWYsIDAsIDBVTCk7Cj4+
ICAJCQlyaW5mby0+cGVyc2lzdGVudF9nbnRzX2MtLTsKPj4gLQkJCV9fZnJlZV9wYWdlKGdudF9s
aXN0X2VudHJ5LT5wYWdlKTsKPj4gLQkJCWtmcmVlKGdudF9saXN0X2VudHJ5KTsKPj4gKwkJCWdu
dF9saXN0X2VudHJ5LT5ncmVmID0gR1JBTlRfSU5WQUxJRF9SRUY7Cj4+ICsJCQlsaXN0X2FkZF90
YWlsKCZnbnRfbGlzdF9lbnRyeS0+bm9kZSwgJnJpbmZvLT5ncmFudHMpOwo+IAo+IFNvcnJ5LCBJ
IGRvbid0IGZvbGxvdyB0aGlzLiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHJlbW92aW5nIHRoZSBn
cmFudAo+IGZyb20gcmluZm8tPmdyYW50cyBsaXN0IHdpdGggbGlzdF9kZWwoKSBhbmQgdGhlbiBh
ZGRpbmcgaXQgYmFjayB3aXRoCj4gbGlzdF9hZGRfdGFpbCgpPwoKVGhlIHBlcnNpc3RlbnQgZ3Jh
bnRzIGFyZSBhdCB0aGUgbGlzdCBoZWFkIGFuZCB0aGUgbm9uLXBlcnNpc3RlbnQgb25lcwphdCB0
aGUgdGFpbC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
