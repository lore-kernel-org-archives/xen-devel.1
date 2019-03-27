From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
Date: Wed, 27 Mar 2019 06:25:31 -0700
Message-ID: <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
References: <77de1587-5683-4ddb-19ca-f71c23e6d7c1@gmail.com>
 <20190322075941.bdf6i3veheiblwzs@MacBook-Air-de-Roger.local>
 <9f9c4a21-b426-f0fc-7c09-2f5d392b488c@gmail.com>
 <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDMvMjcvMjAxOSAxOjE0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wMy4x
OSBhdCAxODoyMSwgPGpscG9vbGU1NkBnbWFpbC5jb20+IHdyb3RlOgo+PiB6ZXRhIC91c3IvbG9j
YWwvc3JjL3hlbiAjIGNhdCB4ZW4vLmNvbmZpZyB8Z3JlcCBDT05GSUdfSFZNCj4+ICMgQ09ORklH
X0hWTSBpcyBub3Qgc2V0Cj4+IHpldGEgL3Vzci9sb2NhbC9zcmMveGVuICMKPj4KPj4gIyB0cmll
ZCAyIGJvb3QgYXR0ZW1wdHMKPj4gbG9nIGF0OiBodHRwczovL3Bhc3RlYmluLmNvbS9uTDRCV0o2
WQo+Pgo+PiBIYW5nIHBvaW50cyBhdCBsaW5lczoKPiBUaGFua3MgZm9yIHRyeWluZyBhbnl3YXk7
IG9uZSBmdXJ0aGVyIHBvc3NpYmlsaXR5IGVsaW1pbmF0ZWQuIExvb2tpbmcKPiBhdCB0aGUgbG9n
cyBJJ3ZlIGhhZCBhbm90aGVyIHRob3VnaHQgKHdpbGQgZ3Vlc3MgYWdhaW4sIHNvIG5vdCByZWFs
bHkKPiBtdWNoIGhvcGUpOiBDb3VsZCB5b3UgdHJ5ICJtd2FpdC1pZGxlPW5vIj8KPgo+IEphbgo+
Cj4KSSBtb2RpZmllZCBtYW5feGVuLmNmZyBieSBhZGRpbmcgYXQgdGhlIGVuZCB0aGUga2VybmVs
IHBhcmFtZXRlcjoKCm13YWl0LWlkbGU9bm8KClJlYm9vdGVkLgpSZXN1bHQ6IGh1bmc6CgouLi4K
KFhFTikgWyAyMDAuOTM5MzUzXSBUU0MgZGVhZGxpbmUgdGltZXIgZW5hYmxlZAooWEVOKSBbMjAx
OS0wMy0yNyAxMzoyMToyMV0gUGxhdGZvcm0gdGltZXIgYXBwZWFycyB0byBoYXZlIHVuZXhwZWN0
ZWRseSAKd3JhcHBlZCAxIHRpbWVzLgooWEVOKSBbMjAxOS0wMy0yNyAxMzoyMToyMV0gbXdhaXQt
aWRsZTogZGlzYWJsZWQKKFhFTikgWzIwMTktMDMtMjcgMTM6MjE6MjFdIEJvb3RpbmcgcHJvY2Vz
c29yIDEvMiBlaXAgM2UwMDAKKFhFTikgWzIwMTktMDMtMjcgMTM6MjE6MjFdIFNldHRpbmcgd2Fy
bSByZXNldCBjb2RlIGFuZCB2ZWN0b3IuCihYRU4pIFsyMDE5LTAzLTI3IDEzOjIxOjIxXSAxLgoo
WEVOKSBbMjAxOS0wMy0yNyAxMzoyMToyMV0gMi4KKFhFTikgWzIwMTktMDMtMjcgMTM6MjE6MjFd
IDMuCihYRU4pIFsyMDE5LTAzLTI3IDEzOjIxOjIxXSBBc3NlcnRpbmcgSU5JVC4KKFhFTikgWzIw
MTktMDMtMjcgMTM6MjE6MjJdIFdhaXRpbmcgZm9yIHNlbmQgdG8gZmluaXNoLi4uCgpMb2cgYXQ6
IGh0dHBzOi8vcGFzdGViaW4uY29tL3pkeWhDdEd2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
