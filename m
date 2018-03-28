From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH] x86/alt: Fix wrong usage of as_max in
 OLDINSTR_2
Date: Wed, 28 Mar 2018 14:12:48 +0800
Message-ID: <f7507a3b-0d95-e633-789b-4ec8c70c837b@oracle.com>
References: <dbcffebe-a10d-4c84-bcb5-44b82d5a9a8e@default>
 <5ABB2DB8020000780012BABC@prv1-mh.provo.novell.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ABB2DB8020000780012BABC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, srinivas.eeda@oracle.com, boris.ostrovsky@oracle.com, xen-devel@lists.xen.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC8zLzI4IDEzOjUyLCBKYW4gQmV1bGljaCB3cml0ZToKPj4+PiBaaGVuemhvbmcgRHVh
biA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gMDMvMjgvMTggNDowMyBBTSA+Pj4KPj4gV2hl
biBBTFRFUk5BVElWRV8yIGlzIHVzZWQsIHdlIHNlZSBiZWxvdyBlcnJvciBkdXJpbmcgYnVpbGQu
Cj4+ICJlcnJvcjogbWFjcm8gImFzX21heCIgcmVxdWlyZXMgMiBhcmd1bWVudHMsIGJ1dCBvbmx5
IDEgZ2l2ZW4iCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcu
ZHVhbkBvcmFjbGUuY29tPgo+IAo+IFNlZSAiW1BBVENIIHYyIDIvNl0geDg2OiBmaXggT0xESU5T
VFJfMigpIiBzZW50IG9uIE1hciAxM3RoLgpPaCwgSSBzZWUuCgpUaGFua3MKWmhlbnpob25nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
