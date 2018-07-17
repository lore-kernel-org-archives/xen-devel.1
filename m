From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 01/11] x86/svm Fixes and cleanup to
 svm_inject_event()
Date: Mon, 16 Jul 2018 22:01:50 -0400
Message-ID: <fa056aeb-0f5f-99b0-9d83-73e0cd098e70@oracle.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-2-git-send-email-andrew.cooper3@citrix.com>
 <5B17E3B002000078001C8BEF@prv1-mh.provo.novell.com>
 <9ba7b376-37af-49db-83fc-184b44f146fe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9ba7b376-37af-49db-83fc-184b44f146fe@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: brian.woods@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTYvMjAxOCAwOTozMyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wNi8x
OCAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ICA+Pj4gT24gMDQuMDYuMTggYXQgMTU6NTks
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+ICogU3RhdGUgYWRqdXN0bWVu
dHMgKGFuZCBkZWJ1ZyB0cmFjaW5nKSBmb3IgI0RCLyNCUC8jUEYgc2hvdWxkIG5vdCBiZSBkb25l
Cj4+PiAgICBmb3IgYGludCAkbmAgaW5zdHJ1Y3Rpb25zLiAgVXBkYXRlcyB0byAlY3IyIG9jY3Vy
IGV2ZW4gaWYgdGhlIGV4Y2VwdGlvbgo+Pj4gICAgY29tYmluZXMgdG8gI0RGLgo+Pj4gICogRG9u
J3Qgb3BlbmNvZGUgRFJfU1RFUCB3aGVuIHVwZGF0aW5nICVkcjYuCj4+PiAgKiBTaW1wbGlmeSB0
aGUgbG9naWMgZm9yIGNhbGxpbmcgc3ZtX2VtdWxfc3dpbnRfaW5qZWN0aW9uKCkgYXMgaW4gdGhl
IGNvbW1vbgo+Pj4gICAgY2FzZSwgZXZlcnkgY29uZGl0aW9uIG5lZWRzIGNoZWNraW5nLgo+Pj4g
ICogRml4IGNvbW1lbnRzIHdoaWNoIGhhdmUgYmVjb21lIHN0YWxlIGFzIGNvZGUgaGFzIG1vdmVk
IGJldHdlZW4gY29tcG9uZW50cy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+Pgo+IFBpbmcgU1ZNPwo+Cj4KCgpSZXZpZXdlZC1ieTog
Qm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
