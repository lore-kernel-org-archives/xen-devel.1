From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] xenstore: increase default thread stack
 size to 32k
Date: Thu, 22 Feb 2018 11:33:59 +0000
Message-ID: <23182.43687.778648.644108@mariner.uk.xensource.com>
References: <20180221221341.17452-1-jfehlig@suse.com>
 <799a00a6-ae10-1fa3-afbb-d94eb0b69dea@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=uojx=fq=citrix.com=prvs=584d65801=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eop95-0001N1-Ck
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 11:34:39 +0000
In-Reply-To: <799a00a6-ae10-1fa3-afbb-d94eb0b69dea@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSB4ZW5zdG9yZTog
aW5jcmVhc2UgZGVmYXVsdCB0aHJlYWQgc3RhY2sgc2l6ZSB0byAzMmsiKToKPiBUaGUgbWFpbiBw
cm9ibGVtIGlzIHRoYXQgYW55IHRocmVhZCBsb2NhbCBzdG9yYWdlIGlzIHRha2VuIGZyb20gdGhl
Cj4gc3RhY2sgd2l0aG91dCBhbnkgaW50ZXJmYWNlIGJlaW5nIGF2YWlsYWJsZSBmb3IgYWRqdXN0
aW5nIHRoZSBfcmVhbF8KPiBzdGFjayBzaXplIGluc3RlYWQgb2YgdGhlIG1lb3J5IGZvciB0aHJl
YWQgbG9jYWwgc3RvcmFnZSArIHN0YWNrLgo+IAo+IFNvIHdlIGNhbiBpbmNyZWFzZSB0aGUgc3Rh
Y2sgc2l6ZSBvZiB0aGUgeGVuc3RvcmUgdGhyZWFkIGFuZCB3YWl0IGZvcgo+IHRoZSBuZXh0IGJy
ZWFrYWdlLCBvciB3ZSBoYXZlIHRvIHRoaW5rIGFib3V0IGEgcHJvcGVyIHNvbHV0aW9uLgo+IAo+
IFJpZ2h0IG5vdyBJIGhhdmUgbm8gc2Vuc2libGUgaWRlYSBob3cgdG8gYWRkcmVzcyB0aGUgcHJv
YmxlbSwgYXMgdGhlCj4gb2xkIHRocmVhZCBzdWdnZXN0cyB0aGUgdW5kZXJseWluZyBnbGliYyBw
cm9ibGVtIGlzbid0IGZpeGVkIHlldCAod293Ogo+IHRoZSBwcm9ibGVtIGlzIGtub3duIGZvciBt
b3JlIHRoYW4gNyB5ZWFycyBub3cpOgo+IAo+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemls
bGEvc2hvd19idWcuY2dpP2lkPTExNzg3CgpPaCEKClRoYW5rIHlvdSwgSnVlcmdlbiwgZm9yIHBy
b3ZpZGluZyBmYWN0cyEKCkkgd2l0aGRyYXcgbXkgYWNrIG9uIHRoaXMgcGF0Y2guCgpJIGFncmVl
IHdpdGggYWxsIHRoZSBjb21wbGFpbnRzIGluIHRoZSBsaWJjIGJ1Z3ppbGxhIGFuZCBkaXNlZ3Jl
ZSB3aXRoCmdsaWJjIHVwc3RyZWFtLiAgSSB0aGluayB0aGlzIHNob3VsZCBiZSBmaXhlZCBpbiB0
aGUgbGliYy4gIFNhZGx5IHRoZQpsaWJjIGJ1Z3ppbGxhIGRvZXNuJ3QgaGF2ZSBhIGxpYmMgcGF0
Y2guCgpJIHdvdWxkIGFjY2VwdCBhIHdvcmthcm91bmQgaW4gbGlieGVuc3RvcmUgdGhhdCBkb2Vz
IHNvbWV0aGluZyBzaW1pbGFyCnRvIHdoYXQgdGhleSBkbyBpbiBSdXN0Li4uCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
