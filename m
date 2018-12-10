From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Disallow moving the APIC MMIO
 window
Date: Mon, 10 Dec 2018 18:18:02 +0100
Message-ID: <20181210171802.qhokuiikcymxryhk@mac>
References: <1544442313-20394-1-git-send-email-andrew.cooper3@citrix.com>
 <1544461466-32130-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1544461466-32130-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgMDU6MDQ6MjZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBTZWUgdGhlIGNvZGUgY29tbWVudCBmb3IgYSBmdWxsIGRpc2N1c3Npb24sIGJ1dCBp
biBzaG9ydDogZ3Vlc3RzIHdoaWNoCj4gY3VycmVudGx5IHJ1biB1bmRlciBYZW4gZG9uJ3QgbW92
ZSB0aGUgd2luZG93LCBiZWNhdXNlIG1vdmluZyBpdCBoYXMgbmV2ZXIKPiB3b3JrZWQgcHJvcGVy
bHkuICBJbXBsZW1lbnRpbmcgc3VwcG9ydCBmb3IgbW92aW5nIHRoZSB3aW5kb3cgaXMgbmV2ZXIg
Z29pbmcgdG8KPiB3b3JrIGFyY2hpdGVjdHVyYWxseSB1bmxlc3Mgd2Ugc3dpdGNoIHRvIHBlci12
Y3B1IFAyTXMgKHdoaWNoIHNlZW1zIHZlcnkKPiB1bmxpa2VseSksIGFuZCB3b3VsZCBzdGlsbCBi
ZSBhIHN1YnN0YW50aWFsIHF1YW50aXR5IG9mIHdvcmsgZm9yIGEgZmVhdHVyZQo+IHdoaWNoIGlz
IHVudXNlZCBpbiBwcmFjdGljZS4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byByZW5hbWUg
dmxhcGljX21zcl9zZXQoKSB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhlCj4gb3RoZXIgTVNSIGhh
bmRsaW5nIGZ1bmN0aW9ucywgYW5kIHJldHVybiBYODZFTVVMXyogY29uc3RhbnRzLiAgQWRkIGxv
Z2ljIHRvCj4gY2hlY2sgZm9yIHJlc2VydmVkIGJpdHMsIGluY2x1ZGluZyByZWZ1c2luZyB4MkFQ
SUMgbW9kZSBpZiBpdCBoYXMgbm90IGJlZW4KPiBvZmZlcmVkIHRvIHRoZSBndWVzdC4gIE1vdmUg
dGhlIGd1ZXN0X3tyZCx3cn1tc3JfeDJhcGljKCkgZGVjbGFyYXRpb25zIGludG8KPiB2bGFwaWMu
aCB3aGljaCBpcyBhIG1vcmUgYXBwcm9wcmlhdGUgcGxhY2UgZm9yIHRoZW0gdG8gbGl2ZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
VGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
