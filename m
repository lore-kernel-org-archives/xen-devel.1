From: Julien Grall <julien.grall@arm.com>
Subject: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 15:57:01 +0000
Message-ID: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qa/0=fy=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ern3X-0002fE-V0
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 15:57:11 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <JBeulich@suse.com>, osstest service owner <osstest-admin@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpXaGlsZSBJIHdhcyBsb29raW5nIGF0IHNvbWUgdW5yZWxhdGVkIHByb2JsZW0gd2l0aCBY
ZW4gQVJNIFAyTSBjb2RlLCBJIApub3RpY2VkIHRoYXQgdGhlIGZ1bmN0aW9uIHVwZGF0ZV9ydW5z
dGF0ZV9hcmVhIGlzIHVzaW5nIGd1ZXN0IHZpcnR1YWwgCmFkZHJlc3MgdG8gdXBkYXRlIHRoZSB2
Q1BVIHJ1bnN0YXRlLiBUaGF0IGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIHdoZW4gCmNvbnRleHQg
c3dpdGNoIHRvIGEgdkNQVS4gSG93ZXZlciwgdGhhdCB2Q1BVIG1heSBydW4gaW4gdXNlcnNwYWNl
IApjb250ZXh0LiBXaGVuIEtQVEkgKGtlcm5lbCBwYWdlIHRhYmxlIGlzb2xhdGlvbikgaXMgdXNl
ZCwKCkluIHRoZSBiZXN0IGNhc2UsIHRoYXQgYWRkcmVzcyBpcyBub3QgbWFwcGVkIGludG8gdGhl
IHBhZ2UtdGFibGUgCmN1cnJlbnRseSB1c2VkLiBYZW4gd2lsbCBub3QgYmUgYWJsZSB0byB1cGRh
dGUgdGhlIHJlZ2lvbi4KCkluIHRoZSB3b3JzdCBjYXNlLCB0aGF0IGFkZHJlc3MgaXMgbWFwcGVk
IHRvIGEgZGlmZmVyZW50IHJlZ2lvbiBhbmQgWGVuIAp3aWxsIGNvcnJ1cHQgc29tZSBiaXRzIG9m
IHRoZSBtZW1vcnkuCgpUaGUgY29kZSBsb29rcyBmdW5kYW1lbnRhbGx5IHdyb25nIG9uIEFybSwg
SSBhbSBlbnRpcmVseSBub3Qgc3VyZSBhYm91dCB4ODYuCgpJdCBsb29rIGxpa2UgdG8gbWUgdGhh
dCBYZW4gc2hvdWxkIGFsd2F5cyB1c2UgdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgCmFuZCB0
aGVyZWZvcmUgdHJhbnNsYXRlIHRoZSB2aXJ0dWFsIGFkZHJlc3MgdG8gYSBwaHlzaWNhbCBvbmUg
aW4gClZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYS4gU28gb25seSB0aGUgcGh5
c2ljYWwgYWRkcmVzcyB3aWxsIApiZSB1c2VkIGluIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhIG1ha2lu
ZyB0aGUgZnVuY3Rpb24gbXVjaCBzYWZlci4KCkFueSBvcGluaW9uIG9uIHRoaXMgYXBwcm9hY2g/
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
