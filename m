From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen: remove redundant put_device
Date: Thu, 6 Sep 2018 10:47:12 +0100
Message-ID: <20180906094712.qc2ukrtvz2jzak64__35699.9787655242$1536227166$gmane$org@zion.uk.xensource.com>
References: <1536215590-400-1-git-send-email-dingxiang@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxqse-0007hO-Nz
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 09:47:16 +0000
Content-Disposition: inline
In-Reply-To: <1536215590-400-1-git-send-email-dingxiang@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Wei Liu <wei.liu2@citrix.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMDYsIDIwMTggYXQgMDI6MzM6MTBQTSArMDgwMCwgRGluZyBYaWFuZyB3cm90
ZToKPiBkZXZpY2VfdW5yZWdpc3RlciB3aWxsIHB1dCBkZXZpY2UsIGRvIG5vdCBuZWVkIHRvIGRv
IGl0IG9uZSBtb3JlIHRpbWUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEaW5nIFhpYW5nIDxkaW5neGlh
bmdAY21zcy5jaGluYW1vYmlsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2ZXJzL3hl
bi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiBpbmRleCA1YjQ3MTg4Li5jZmFhODc4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+ICsrKyBiL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwo+IEBAIC0zNjksNyArMzY5LDYgQEAgc3RhdGljIHZv
aWQgeGVuYnVzX2NsZWFudXBfZGV2aWNlcyhjb25zdCBjaGFyICpwYXRoLCBzdHJ1Y3QgYnVzX3R5
cGUgKmJ1cykKPiAgCQlidXNfZm9yX2VhY2hfZGV2KGJ1cywgTlVMTCwgJmluZm8sIGNsZWFudXBf
ZGV2KTsKPiAgCQlpZiAoaW5mby5kZXYpIHsKPiAgCQkJZGV2aWNlX3VucmVnaXN0ZXIoJmluZm8u
ZGV2LT5kZXYpOwo+IC0JCQlwdXRfZGV2aWNlKCZpbmZvLmRldi0+ZGV2KTsKClRoaXMgaXMgdG8g
bWF0Y2ggdGhlIGdldF9kZXZpY2UgY2FsbCBpbiBjbGVhbnVwX2Rldi4gSXQgaXMgbm90IHJlZHVu
ZGFudApJTUhPLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
