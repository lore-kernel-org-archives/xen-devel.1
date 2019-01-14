From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] pvcalls-front: Replace GFP_KERNEL with
 GFP_ATOMIC in create_active
Date: Mon, 14 Jan 2019 18:45:28 -0500
Message-ID: <87b463b5-9013-d878-9c30-64dfc3640514__23074.0548148335$1547509531$gmane$org@oracle.com>
References: <1547480909-11844-1-git-send-email-wdjjwb@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bjvR=PW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gjBwG-0001G0-UD
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 23:46:40 +0000
In-Reply-To: <1547480909-11844-1-git-send-email-wdjjwb@163.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wangbo <wdjjwb@163.com>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, wang.bo116@zte.com.cn, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNC8xOSAxMDo0OCBBTSwgd2FuZ2JvIHdyb3RlOgo+IENyZWF0ZV9hY3RpdmUgbWF5IGNh
bGxlZCBpbnNpZGUgc3BpbmxvY2sscmVwbGFjZSBHRlBfS0VSTkVMIHdpdGggR0ZQX0FUT01JQwoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVuL3RpcC5n
aXQvY29tbWl0Lz9oPWZvci1saW51cy00LjIxJmlkPTlmNTFjMDVkYzQxYTZkNjk0MjNlM2QwM2Qx
OGViN2FiMjJmOWVjMTkKaXMgcXVldWVkIGFuZCBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgoKKFBs
ZWFzZSBydW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBvbiB5b3VyIHBhdGNoZXMsIG90aGVy
d2lzZSB0aGV5Cm1heSBiZSBtaXNzZWQgYW5kIGRlbGF5ZWQpCgotYm9yaXMKCgo+Cj4gU2lnbmVk
LW9mZi1ieTogd2FuZ2JvIDx3YW5nLmJvMTE2QHp0ZS5jb20uY24+Cj4gLS0tCj4gIGRyaXZlcnMv
eGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2Fs
bHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+IGluZGV4IDc3MjI0ZDgu
LjMxYmQzYzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCj4gKysr
IGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCj4gQEAgLTM0NCwxMSArMzQ0LDExIEBAIHN0
YXRpYyBpbnQgY3JlYXRlX2FjdGl2ZShzdHJ1Y3Qgc29ja19tYXBwaW5nICptYXAsIGludCAqZXZ0
Y2huKQo+ICAJaW5pdF93YWl0cXVldWVfaGVhZCgmbWFwLT5hY3RpdmUuaW5mbGlnaHRfY29ubl9y
ZXEpOwo+ICAKPiAgCW1hcC0+YWN0aXZlLnJpbmcgPSAoc3RydWN0IHB2Y2FsbHNfZGF0YV9pbnRm
ICopCj4gLQkJX19nZXRfZnJlZV9wYWdlKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsKPiArCQlf
X2dldF9mcmVlX3BhZ2UoR0ZQX0FUT01JQyB8IF9fR0ZQX1pFUk8pOwo+ICAJaWYgKG1hcC0+YWN0
aXZlLnJpbmcgPT0gTlVMTCkKPiAgCQlnb3RvIG91dF9lcnJvcjsKPiAgCW1hcC0+YWN0aXZlLnJp
bmctPnJpbmdfb3JkZXIgPSBQVkNBTExTX1JJTkdfT1JERVI7Cj4gLQlieXRlcyA9ICh2b2lkICop
X19nZXRfZnJlZV9wYWdlcyhHRlBfS0VSTkVMIHwgX19HRlBfWkVSTywKPiArCWJ5dGVzID0gKHZv
aWQgKilfX2dldF9mcmVlX3BhZ2VzKEdGUF9BVE9NSUMgfCBfX0dGUF9aRVJPLAo+ICAJCQkJCVBW
Q0FMTFNfUklOR19PUkRFUik7Cj4gIAlpZiAoYnl0ZXMgPT0gTlVMTCkKPiAgCQlnb3RvIG91dF9l
cnJvcjsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
