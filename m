From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] libxl: modify domain config when moving
 domain to another cpupool
Date: Wed, 3 Oct 2018 12:29:07 +0100
Message-ID: <20181003112907.biz3otymaqyyl4kl@zion.uk.xensource.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-2-jgross@suse.com>
 <CAFLBxZZr_9N9ngN9ScBFR_Twm3vhgW48PQ1ibwc2XZ=FxtEYWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7fL5-0006ft-A5
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:29:11 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZZr_9N9ngN9ScBFR_Twm3vhgW48PQ1ibwc2XZ=FxtEYWQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMTI6MDI6MjRQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBUdWUsIE9jdCAyLCAyMDE4IGF0IDM6MjAgUE0gSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBUb2RheSB0aGUgZG9tYWluIGNvbmZpZyBpbmZv
IGNvbnRhaW5zIHRoZSBjcHVwb29sIG5hbWUgdGhlIGRvbWFpbiB3YXMKPiA+IHN0YXJ0ZWQgaW4g
b25seSBpZiB0aGUgY3B1cG9vbCB3YXMgc3BlY2lmaWVkIGF0IGRvbWFpbiBjcmVhdGlvbi4gTW92
aW5nCj4gPiB0aGUgZG9tYWluIHRvIGFub3RoZXIgY3B1cG9vbCBsYXRlciB3b24ndCBjaGFuZ2Ug
dGhhdCBpbmZvcm1hdGlvbi4KPiA+Cj4gPiBDb3JyZWN0IHRoYXQgYnkgbW9kaWZ5aW5nIHRoZSBk
b21haW4gY29uZmlnIGFjY29yZGluZ2x5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8gZG8gdGhp
cyB0aGUgc2FtZSB3YXkgdGhlIHNjaGVkdWxpbmcgcGFyYW1ldGVycwo+IHdhcyBkb25lIC0tIGJ5
IGFkZGluZyB0aGlzIHRvIGxpYnhsX3JldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uKCk/Cj4g
VGhhdCB3YXkgdGhlIGNwdXBvb2wgd291bGQgc2hvdyB1cCBpbiBgeGwgbGlzdCAtbGAgYXMgd2Vs
bCAoSSB0aGluaykuCgpUaGlzIGFscmVhZHkgbW9kaWZpZXMgdGhlIHNhdmVkIHN0YXRlIGZpbGUs
IHRoZXJlIHdpbGwgbm90IGJlIG1pc21hdGNoCmJldHdlZW4gdGhlIHNhdmVkIHN0YXRlIGFuZCB0
aGUgc3RhdGUgaW4gaHlwZXJ2aXNvci4gYHhsIGxpc3QgLWxgIHNob3VsZAp3b3JrIGp1c3QgZmlu
ZS4KCldlaS4KCj4gCj4gIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
