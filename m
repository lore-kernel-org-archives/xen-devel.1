From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V11 5/5] p2m: change_type_range: Only
 invalidate mapped gfns
Date: Thu, 20 Dec 2018 16:17:24 +0000
Message-ID: <f681930e-4b89-1fc2-e1b3-2a179dd4d641@citrix.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-6-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z86S=O5=citrix.com=prvs=885450f5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ga1CR-000749-6x
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 16:29:27 +0000
In-Reply-To: <1544001488-23763-6-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNS8xOCA5OjE4IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gY2hhbmdlX3R5cGVf
cmFuZ2UoKSBpbnZhbGlkYXRlcyBnZm4gcmFuZ2VzIHRvIGxhemlseSBjaGFuZ2UgdGhlIHR5cGUK
PiBvZiBhIHJhbmdlIG9mIGdmbnMsIGFuZCBhbHNvIG1vZGlmaWVzIHRoZSBsb2dkaXJ0eSByYW5n
ZXNldHMgb2YgdGhhdAo+IHAybS4gQXQgdGhlIG1vbWVudCwgaXQgY2xpcHMgYm90aCBkb3duIGJ5
IHRoZSBob3N0cDJtLgo+IAo+IFdoaWxlIHRoaXMgd2lsbCByZXN1bHQgaW4gY29ycmVjdCBiZWhh
dmlvciwgaXQncyBub3QgZW50aXJlbHkgZWZmaWNpZW50LAo+IHNpbmNlIGludmFsaWRhdGVkIGVu
dHJpZXMgb3V0c2lkZSB0aGF0IHJhbmdlIHdpbGwsIG9uIGZhdWx0LCBzaW1wbHkgYmUKPiBtb2Rp
ZmllZCBiYWNrIHRvICJlbXB0eSIgYmVmb3JlIGZhdWx0aW5nIG5vcm1hbGx5IGFnYWluLgo+IAo+
IFNlcGFyYXRlIG91dCB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHR3byByYW5nZXMuIEtlZXAgdXNp
bmcgdGhlCj4gaG9zdHAybSdzIG1heF9tYXBwZWRfcGZuIHRvIGNsaXAgdGhlIGxvZ2RpcnR5IHJh
bmdlcywgYnV0IHVzZSB0aGUKPiBjdXJyZW50IHAybSdzIG1heF9tYXBwZWRfcGZuIHRvIGZ1cnRo
ZXIgY2xpcCB0aGUgaW52YWxpZGF0aW9uIHJhbmdlCj4gZm9yIGFsdGVybmF0ZSBwMm1zLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBUZXN0
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCkFja2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpTbyBpdCBsb29rcyBsaWtl
IGFzIHNvb24gYXMgd2UgZ2V0IHBhdGNoIDQgaW50byBzaGFwZSB3ZSBjYW4gY2hlY2sgdGhpcyBp
bi4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
