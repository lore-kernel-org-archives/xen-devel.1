From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v4 00/14] Argo: hypervisor-mediated
 interdomain communication
Date: Tue, 15 Jan 2019 14:39:40 -0800
Message-ID: <CACMJ4GZB1HEsE_sHuxBXc52F1gb4Z7jDp2-545wbOg5_mFbtJg@mail.gmail.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <20190115163259.44yef6hjpd3mvl6p@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjXNC-00076Z-PZ
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 22:39:54 +0000
Received: by mail-lj1-x242.google.com with SMTP id q2-v6so3766295lji.10
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 14:39:54 -0800 (PST)
In-Reply-To: <20190115163259.44yef6hjpd3mvl6p@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgODozNCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCAwMToyNzoz
MkFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiA+IFZlcnNpb24gZm91ciBvZiB0
aGlzIHBhdGNoIHNlcmllcy4KPiA+Cj4gPiAqIENoYW5nZXMgYXJlIHByaW1hcmlseSBhZGRyZXNz
aW5nIGZlZWRiYWNrIGZyb20gdGhlIHYzIHNlcmllcyByZXZpZXdzLgo+ID4gICBNYW55IHBvaW50
cyBub3RlZCBvbiB0aGUgaW52aWRpZHVhbCBjb21taXQgcG9zdHMuCj4gPgo+ID4gKiBSZWdpc3Rl
ciByaW5nIGludGVyZmFjZXMgdXNlcyBYZW4gZ2ZucyBhcyBwYWdlIGlkZW50aWZpZXJzLAo+ID4g
ICBhbmQgdGhlIGFyZ3VtZW50cyBubyBsb25nZXIgc3BlY2lmeSBwYWdlIGdyYW51bGFyaXR5Lgo+
ID4KPiA+ICogTXVsdGktbGV2ZWwgbG9jayB2YWxpZGF0aW9uIG1hY3JvcyBkZWZpbmVkIGFuZCBh
cHBsaWVkLgo+ID4gICBMb2NrcyByZW5hbWVkIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkuCj4gPgo+
ID4gKiBIeXBlcmNhbGwgYXJndW1lbnQgc3RydWN0IGNoZWNraW5nIGlzIGZvbGRlZCBpbmxpbmUg
aW50byB0aGUgc2VyaWVzLAo+ID4gICBjaGVja3MgYXBwbGllZCBhcyB0eXBlcyBhcmUgaW50cm9k
dWNlZC4KPiA+Cj4gPiAqIGFyZ28tbWFjIHN0cmluZyBib290IHBhcmFtZXRlciBjaGFuZ2VkIHRv
IGFyZ28tbWFjLXBlcm1pc3NpdmUgYm9vbGVhbgo+ID4KPiA+IEZlZWRiYWNrIGl0ZW1zIHRoYXQg
YXJlIHJlbWFpbmluZyB0byBiZSBhZGRyZXNzZWQgaGF2ZSBiZWVuIG5vdGVkIHdpdGgKPiA+IGNv
bW1lbnRzIGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgYXQgdGhlIGxvY2F0aW9uIGluIHRoZSBj
b2RlLgo+Cj4gVGhhbmtzLiBJJ3ZlIG1hZGUgc29tZSBjb21tZW50cyBvbiB0aGUgcGF0Y2hlcywg
YnV0IG92ZXJhbGwgdGhpcyBMR1RNLgo+IFRoYW5rcyBmb3IgaW1wcm92aW5nIHRoZSBsb2NraW5n
IG5hbWVzIGFuZCB0aGUgY29tbWVudHMuCgpZb3UncmUgd2VsY29tZSAtIHRoYW5rcyBmb3IgdGhl
IGRldGFpbGVkIHJldmlld3MgYW5kIGZlZWRiYWNrLgoKPiBJIHRoaW5rIG15IG9ubHkgcmVxdWVz
dCB3b3VsZCBiZSB0byBhZGQgdGhlIHVzYWdlIG9mIHZtYXAgaW4gb3JkZXIgdG8KPiBtYXAgdGhl
IHJpbmdzIGluIGEgRklYTUUsIHNvIGl0J3Mgbm90IGZvcmdvdHRlbi4gVGhhdCBjYW4gYmUgbGlr
ZWx5Cj4gZG9uZSBhZnRlciA0LjEyIGlmIHRoZXJlIGFyZSB0aW1lIGNvbnN0cmFpbnMgKGFuZCBt
YXliZSBtb3JlCj4gaW1wb3J0YW50IGlzc3VlcyB0byBzb2x2ZSkuCgpBY2ssIEkndmUgYWRkZWQg
dGhpcyBhbmQgaXQgd2lsbCBiZSBpbmNsdWRlZCBpbiB0aGUgbmV4dCBwb3N0aW5nLgoKdGhhbmtz
LAoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
