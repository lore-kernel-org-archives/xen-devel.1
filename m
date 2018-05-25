From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] xen/svm: don't clear interception for MSRs
 required for introspection
Date: Fri, 25 May 2018 18:25:51 +0300
Message-ID: <f5038544-fe02-78b0-5f8e-09aac8749b42@bitdefender.com>
References: <1527251902-2523-1-git-send-email-rcojocaru@bitdefender.com>
 <70932389-9820-c2ca-ea20-939e6d051717@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <70932389-9820-c2ca-ea20-939e6d051717@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xen.org
Cc: andrew.cooper3@citrix.com, brian.woods@amd.com, jbeulich@suse.com, suravee.suthikulpanit@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjUvMjAxOCAwNjoxOSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA1LzI1
LzIwMTggMDg6MzggQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gVGhpcyBwYXRjaCBtaXJy
b3JzIHRoZSBWTVggY29kZSB0aGF0IGRvZXNuJ3QgYWxsb3cKPj4gdm14X2Rpc2FibGVfaW50ZXJj
ZXB0X2Zvcl9tc3IoKSAKPiAKPiB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCgpID8KPiAKPj4gdG8g
Y2xlYXIgaW50ZXJjZXB0aW9uIG9mIE1TUnMgdGhhdAo+PiBhbiBpbnRyb3NwZWN0aW9uIGFnZW50
IGlzIHRyeWluZyB0byBtb25pdG9yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gCj4gV2l0aCB0aGF0IGZpeGVkLAo+IAo+
IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
PgoKQXBvbG9naWVzLCB5b3UncmUgcmlnaHQuIEkgd2FzIGxvb2tpbmcgYXQgdGhlIG9yaWdpbmFs
IHBhdGNoLCB3aGVyZQp0aGVyZSdzIHZteF9kaXNhYmxlX2ludGVyY2VwdF9mb3JfbXNyKCk6Cgpo
dHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD00
OTBhMzlhMWRiYzc0MDY3NzYzNDRmMzZlMWIyN2MzM2MyYWRhNjNkCgpJJ2xsIHN1Ym1pdCBWMiB3
aXRoIHRoYXQgY29ycmVjdGVkICh1bmxlc3MgaXQncyBwcmVmZXJyYWJsZSBmb3IgdGhhdCB0bwpi
ZSBjaGFuZ2VkIG9uIGNvbW1pdD8pLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
