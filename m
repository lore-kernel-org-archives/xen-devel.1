From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/mmcfg: Rename pt_pci_init() and
 call it in acpi_mmcfg_init()
Date: Fri, 17 Aug 2018 06:10:46 -0600
Message-ID: <5B76BB4602000078001DF686@prv1-mh.provo.novell.com>
References: <1aaa3e56-94b9-4b37-8090-ae47cb2cab25@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1aaa3e56-94b9-4b37-8090-ae47cb2cab25@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com, david.westwood@hpe.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDA5OjAxLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gR2l2ZW4gd2hhdCBwdF9wY2lfaW5pdCgpIGFjdHVhbGx5IGRvZXMsIHJlbmFtZSBpdCBw
cm9wZXJseSBhbmQgbW92ZSBpdHMKPiBkZWNsYXJhdGlvbiB0byBwY2kuaCwgbW92ZSB0aGUgb25s
eSBjYWxsIGluIGFjcGlfbW1jZmdfaW5pdCgpLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUu
Y29tPgo+IFRlc3RlZC1ieTogR29wYWxhc2V0dHksIE1hbm9qIDxtYW5vai5nb3BhbGFzZXR0eUBo
cGUuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
