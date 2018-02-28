From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 5/6] xen/domain: Call sched_destroy_domain()
 in the domain_create() error path
Date: Wed, 28 Feb 2018 16:24:14 +0000
Message-ID: <ece980a2-29d1-c79d-b489-652600f2bb47@citrix.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwMjoxNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJZiBkb21haW5f
Y3JlYXRlKCkgZmFpbHMsIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95KCkgZG9lc24ndCBnZXQgY2Fs
bGVkLAo+IG1lYW5pbmcgdGhhdCBzY2hlZF9kZXN0cm95X2RvbWFpbigpIGlzIG1pc3NlZC4gIElu
IHByYWN0aWNlLCB0aGlzIGNhbiBvbmx5Cj4gZmFpbCBiZWNhdXNlIG9mIGV4Y2VwdGlvbmFsIGxh
dGVfaHdkb21faW5pdCgpIGlzc3VlcyBhdCB0aGUgbW9tZW50Lgo+IAo+IE1ha2Ugc2NoZWRfZGVz
dHJveV9kb21haW4oKSBpZGVtcG90ZW50LCBhbmQgY2FsbCBpdCBpbiB0aGUgZmFpbCBwYXRoLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
