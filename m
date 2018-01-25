From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-users] xen_pt_region_update: Error: create new
 mem mapping failed! (err: 22)
Date: Thu, 25 Jan 2018 11:29:37 +0000
Message-ID: <20180125112937.GB2183@perard.uk.xensource.com>
References: <e448ae30-b6fc-1871-a168-89e804113b19@alstadheim.priv.no>
 <CAFLBxZb4feAU79Y1xyryfZcmpsidJ9sbn4yfro+2kdVwt0fCcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gqmg=eu=citrix.com=prvs=556372074=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1eefiu-0001Ct-LU
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 11:29:40 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZb4feAU79Y1xyryfZcmpsidJ9sbn4yfro+2kdVwt0fCcQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?iso-8859-1?Q?H=E5kon?= Alstadheim <hakon@alstadheim.priv.no>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjUsIDIwMTggYXQgMTA6Mjg6MTRBTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCA5OjU5IFBNLCBIw6Vrb24gQWxzdGFkaGVp
bQo+IDxoYWtvbkBhbHN0YWRoZWltLnByaXYubm8+IHdyb3RlOgo+ID4gSSdtIHRyeWluZywgYW5k
IGZhaWxpbmcsIHRvIGxhdW5jaCBhIHZtIHdpdGggYmlvcyA9ICdvdm1mJyB1bmRlciB4ZW4gNC4x
MC4KPiA+Cj4gPiBUaGUgZG9tYWluIGxhdW5jaGVzIE9LIGFzIGxvbmcgYXMgSSBkbyBub3QgcGFz
cyBhbnkgcGNpIGRldmljZXMgdGhyb3VnaCwKPiA+IGJ1dCB3aXRoIHBjaSBkZXZpY2VzIHBhc3Nl
ZCB0aHJvdWdoLAo+IAo+IEFudGhvbnksCj4gCj4gRG9lcyBPVk1GIHN1cHBvcnQgUENJIHBhc3Mt
dGhyb3VnaCB5ZXQ/CgpJIGRvbid0IHRoaW5rIE9WTUYgY2FyZXMgaWYgYSBQQ0kgZGV2aWNlIGlz
IHBhc3MtdGhyb3VnaCBvciBub3QuIERvZXMKdGhlIFZNIHdvcmtzIHdpdGggYmlvcz1zZWFiaW9z
ID8KClRoZXJlIGlzIG1heWJlIHNvbWV0aGluZ3Mgd3Jvbmcgd2l0aCB0aGUgd2F5IE9WTUYgaGFu
ZGxlcyBQQ0kgZGV2aWNlcwp0aGF0IGRvZXNuJ3Qgd29yayB3aXRoIHBhc3MtdGhyb3VnaC4KCkjD
pWtvbiwgY291bGQgeW91IGFkZCB0aGUgZm9sbG93aW5nIGluIHRoZSBWTSBjb25maWc/IFdpdGgg
dGhhdCwgd2UgY291bGQKZ2V0IHNvbWUgbG9ncyBmcm9tIE9WTUY6CmRldmljZV9tb2RlbF9hcmdz
X2h2bSA9IFsKICAnLWNoYXJkZXYnLCAnZmlsZSxpZD1kZWJ1Z2NvbixtdXg9b24scGF0aD0vdG1w
L09WTUYubG9ncywnLAogICctZGV2aWNlJywgJ2lzYS1kZWJ1Z2Nvbixpb2Jhc2U9MHg0MDIsY2hh
cmRldj1kZWJ1Z2NvbicsCl0KKEZlZWwgZnJlZSB0byBjaGFuZ2UgdGhlIHBhdGguKQoKVGhhbmtz
LAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
