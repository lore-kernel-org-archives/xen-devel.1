From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/msr: Fix fallout from mostly c/s 832c180
Date: Wed, 10 Apr 2019 09:23:14 +0100
Message-ID: <20190410082314.GS30543@zion.uk.xensource.com>
References: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDY6NTM6NDdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgc2VyaWVzIDgzMmMxODAzXi4uZjYxNjg1YTYgd2FzIGNvbW1pdHRlZCB3aXRo
b3V0IGFkZXF1YXRlIHJldmlldy4KPiAKPiAgKiBGaXggdGhlIHNoaW0gYnVpbGQgYnkgcHJvdmlk
aW5nIGEgIUNPTkZJR19IVk0gZGVjbGFyYXRpb24gZm9yCj4gICAgaHZtX2dldF9ndWVzdF9ibmRj
ZmdzKCkKPiAgKiBSZXZlcnQgdGhlIGJvZ3VzIGRlLWNvbnN0J2luZyBvZiB0aGUgdmNwdSBwb2lu
dGVyIGluCj4gICAgdm14X2dldF9ndWVzdF9ibmRjZmdzKCkuICB2bXhfdm1jc19lbnRlcigpIHJl
YWxseSBkb2VzIG11dGF0ZSB0aGUgdmNwdSwgYW5kCj4gICAgbWF5IGNhdXNlIGl0IHRvIHVuZGVy
Z28gYSBmdWxsIGRlL3Jlc2NoZWR1bGUsIHdoaWNoIGlzIGluIHZpb2xhdGlvbiBvZiB0aGUKPiAg
ICBBQkkgZGVzY3JpYmVkIGJ5IGh2bV9nZXRfZ3Vlc3RfYm5kY2ZncygpLiAgZ3Vlc3RfcmRtc3Io
KSB3YXMgYWx3YXlzIGdvaW5nCj4gICAgdG8gbmVlZCB0byBsb3NlIGl0cyBjb25zdCBwYXJhbWV0
ZXIsIGFuZCB0aGlzIHdhcyB0aGUgY29ycmVjdCB0aW1lIGZvciBpdAo+ICAgIHRvIGhhcHBlbi4K
CkVubGlnaHRlbiBtZSAtLSB3aHkgZG9lcyBndWVzdF9yZG1zciBuZWVkIHRvIGxvc2UgaXRzIGNv
bnN0IHBhcmFtZXRlcj8KClRoaXMgcmVhZHMgYXMgaWYgdGhlIGNvZGUgd2FzIGJ1Z2d5IGZyb20g
dGhlIGdldC1nby4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
