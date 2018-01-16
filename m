From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen/grant-table: Use put_page instead
	of free_page
Date: Tue, 16 Jan 2018 13:47:01 -0500
Message-ID: <6d3faf73-c8aa-db9a-1629-a9de85a1b377__31797.3173027442$1516128374$gmane$org@oracle.com>
References: <20180111093638.28937-1-ross.lagerwall@citrix.com>
 <20180111093638.28937-2-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=o+4p=el=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ebWGK-0001IW-Jh
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 18:47:08 +0000
In-Reply-To: <20180111093638.28937-2-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwNDozNiBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gVGhlIHBhZ2Ug
Z2l2ZW4gdG8gZ250dGFiX2VuZF9mb3JlaWduX2FjY2VzcygpIHRvIGZyZWUgY291bGQgYmUgYQo+
IGNvbXBvdW5kIHBhZ2Ugc28gdXNlIHB1dF9wYWdlKCkgaW5zdGVhZCBvZiBmcmVlX3BhZ2UoKSBz
aW5jZSBpdCBjYW4KPiBoYW5kbGUgYm90aCBjb21wb3VuZCBhbmQgc2luZ2xlIHBhZ2VzIGNvcnJl
Y3RseS4KPgo+IFRoaXMgYnVnIHdhcyBkaXNjb3ZlcmVkIHdoZW4gbWlncmF0aW5nIGEgWGVuIFZN
IHdpdGggc2V2ZXJhbCBWSUZzIGFuZAo+IENPTkZJR19ERUJVR19WTSBlbmFibGVkLiBJdCBoaXRz
IGEgQlVHIHVzdWFsbHkgYWZ0ZXIgZmV3ZXIgdGhhbiAxMAo+IGl0ZXJhdGlvbnMuIEFsbCBuZXRm
cm9udCBkZXZpY2VzIGRpc2Nvbm5lY3QgZnJvbSB0aGUgYmFja2VuZCBkdXJpbmcgYQo+IHN1c3Bl
bmQvcmVzdW1lIGFuZCB0aGlzIHdpbGwgY2FsbCBnbnR0YWJfZW5kX2ZvcmVpZ25fYWNjZXNzKCkg
aWYgYQo+IG5ldGZyb250IHF1ZXVlIGhhcyBhbiBvdXRzdGFuZGluZyBza2IuIFRoZSBtaXNtYXRj
aCBiZXR3ZWVuIGNhbGxpbmcKPiBnZXRfcGFnZSgpIGFuZCBmcmVlX3BhZ2UoKSBvbiBhIGNvbXBv
dW5kIHBhZ2UgY2F1c2VzIGEgcmVmZXJlbmNlCj4gY291bnRpbmcgZXJyb3Igd2hpY2ggaXMgZGV0
ZWN0ZWQgd2hlbiBERUJVR19WTSBpcyBlbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
