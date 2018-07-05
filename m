From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 19:20:10 +0200
Message-ID: <90bab90b-387e-e807-0d91-2492c9253a79@eikelenboom.it>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
 <341794021.20180705174025@eikelenboom.it>
 <23358.17933.141197.826134@mariner.uk.xensource.com>
 <FB11B977-C6B6-4A82-BB05-00D5F701D67B@citrix.com>
 <d5942e06-98cc-63dc-549c-dd3e471ca125@citrix.com>
 <23358.20262.278645.448005@mariner.uk.xensource.com>
 <a0fb7723-8d48-4f34-2f56-b0be8ebb3088@eikelenboom.it>
 <23358.20774.515467.286714@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=woxl=jv=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1fb7vb-0004ok-FE
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:20:23 +0000
In-Reply-To: <23358.20774.515467.286714@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDcvMTggMTk6MTEsIElhbiBKYWNrc29uIHdyb3RlOgo+IFNhbmRlciBFaWtlbGVuYm9v
bSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3VtbWl0IDIwMTggZGVz
aWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhseSByZWxlYXNlIENh
ZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPj4gSnVzdCB3b25kZXJp
bmcsIGFyZSB0aGVyZSBhbnkgdGltaW5nIHN0YXRpc3RpY3Mga2VwdCBmb3IgdGhlIE9TU3Rlc3QK
Pj4gZmxpZ2h0cyAoYW5kIHNlcGFyYXRlIGZvciBidWlsZGluZyB0aGUgdmFyaW91cyBjb21wb25l
bnRzIGFuZCBydW5uaW5nCj4+IHRoZSBpbmRpdmlkdWFsIHRlc3RzID8pLiBPciBzaG91bGQgdGhl
eSBiZSBwYXJzZS1hYmxlIGZyb20gdGhlIGxvZ3Mga2VwdCA/Cj4gCj4gWWVzLiAgVGhlIGRhdGFi
YXNlIGhhcyBhIHN0YXJ0ZWQgYW5kIHN0b3BwZWQgdGltZV90IGZvciBlYWNoIHRlc3QKPiBzdGVw
LiAgVGhhdCdzIHdoZXJlIEkgZ290IHRoZSB+MTUgbWlucyBudW1iZXIgZnJvbS4KPiAKPiBJYW4u
Cj4gCgpBbmQgd2hhdCB0aW1lIGRvZXMgYSBjb21wbGV0ZSBmbGlnaHQgZm9yIGEgcHVzaCB3b3Vs
ZCByZXF1aXJlIGF0IG1pbmltdW0gPwphbmQgaXMgdGhlcmUgbXVjaCB2YXJpYXRpb24gYmV0d2Vl
biBmbGlnaHRzIChkb2VzIGEgbm9uIHB1c2ggd2l0aCBzb21lIGZhaWxpbmcgdGVzdCByZXF1aXJl
IG1vcmUgb3IgbGVzcyB0aW1lIHRoYW4gYSBzdWNjZXNmdWwgb25lKSA/CgotLQpTYW5kZXIKCkJU
VzoKVGhlIGxpbmsgZm9sbG93aW5nIGxpbms6IGh0dHA6Ly9vc3N0ZXN0LnhzLmNpdHJpdGUubmV0
L35vc3N0ZXN0L3Rlc3Rsb2dzL2xvZ3MKRnJvbSB0aGUgb3NzdGVzdCBtYWlsIHdpdGggc3ViamVj
dDogIltYZW4tZGV2ZWxdIFt4ZW4tNC4xMC10ZXN0aW5nIGJhc2VsaW5lLW9ubHkgdGVzdF0gNzQ5
Mzc6IHRvbGVyYWJsZSBGQUlMIiBkb2Vzbid0IHNlZW0gdG8gd29yayIKCihJcyB0aGF0IHNlcnZl
ciBub3QgcHVibGljbHkgYWNjZXNzaWJsZSAgPykKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
