From: zhong jiang <zhongjiang@huawei.com>
Subject: Re: [PATCH] xen: remove unnecessary condition check
 before kfree
Date: Mon, 10 Sep 2018 21:52:53 +0800
Message-ID: <5B967735.1020001__39411.696061916$1536587509$gmane$org@huawei.com>
References: <1536416318-34106-1-git-send-email-zhongjiang@huawei.com>
 <12d9b430-e08a-3e28-5289-028f6b395d11@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgps=ly=huawei.com=zhongjiang@srs-us1.protection.inumbo.net>)
 id 1fzMcg-0002Ft-BF
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 13:53:02 +0000
In-Reply-To: <12d9b430-e08a-3e28-5289-028f6b395d11@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC85LzEwIDE3OjUyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA4LzA5LzE4IDE2
OjE4LCB6aG9uZyBqaWFuZyB3cm90ZToKPj4ga2ZyZWUgaGFzIHRha2VuIG51bGwgcG9pbnRlciBp
bnRvIGFjY291bnQuIFNvIGp1c3QgcmVtb3ZlIHRoZQo+PiBjb25kaXRpb24gY2hlY2sgYmVmb3Jl
IGtmcmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB6aG9uZyBqaWFuZyA8emhvbmdqaWFuZ0BodWF3
ZWkuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jIHwgMiAr
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYyBiL2RyaXZlcnMv
eGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCj4+IGluZGV4IGZiYjkxMzcuLjdlMWQ0OWUgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCj4+ICsrKyBiL2RyaXZl
cnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCj4+IEBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGlj
IGludCBwdXNoX3B4eF90b19oeXBlcnZpc29yKHN0cnVjdCBhY3BpX3Byb2Nlc3NvciAqX3ByKQo+
PiAgCQlwcl93YXJuKCIoX1BYWCk6IEh5cGVydmlzb3IgZXJyb3IgKCVkKSBmb3IgQUNQSSBDUFUl
dVxuIiwKPj4gIAkJCXJldCwgX3ByLT5hY3BpX2lkKTsKPj4gIGVycl9mcmVlOgo+PiAtCWlmICgh
SVNfRVJSX09SX05VTEwoZHN0X3N0YXRlcykpCj4+ICsJaWYgKCFJU19FUlIoZHN0X3N0YXRlcykp
Cj4gVGhpcyBpcyBqdXN0IGEgY2hhbmdlIG9mIHRoZSBjb25kaXRpb24sIG5vdCBhIHJlbW92YWwu
Cj4KPiBJIGRvbid0IHRoaW5rIGNoYW5nZSBpcyB3b3J0aCBpdC4KPgogRmluZSwgSSBqdXN0IGNv
bnNpZGVyIHRoZSBkdXBsaWNhdGlvbiBvZiBmdW5jdGlvbi4gIE9mIGNvdXJzZS4gbWFrZSBzZW5z
ZSB5b3UgaGF2ZSBzYWlkLgogTWF5YmUgaXQgd2lsbCBtb3JlIGNsZWFyIHRvIGhhdmUgdGhlIGp1
ZGdlbWVudC4KCiBUaGFua3MsCiB6aG9uZyBqaWFuZwo+IEp1ZXJnZW4KPgo+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
