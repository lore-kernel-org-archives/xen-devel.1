From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Mon, 21 May 2018 15:28:35 +0100
Message-ID: <72b85eed-79e8-25da-0558-c431e71761b9@citrix.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y48b=ii=citrix.com=prvs=672c3284e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fKlnz-0002B3-Q8
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 14:28:55 +0000
In-Reply-To: <20180521141600.5516-1-george.dunlap@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ben Guthro <benjamin.guthro@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDUvMTggMTU6MTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gTW9zdCBzZXJ2ZXItY2xh
c3MgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IEFDUEkgUzMgc3VzcGVuZDsgYnV0IG1vc3QKPiBi
dWdzIHdlJ2xsIHJ1biBhY3Jvc3Mgd29uJ3QgbmVlZCBhY3R1YWwgUzMgdG8gdHJpZ2dlci4gIEFk
ZCBhCj4gY29tbWFuZC1saW5lIHBhcmFtZXRlciBmb3IgYSAiZmFrZSIgUzMsIHdoaWNoIHdpbGwg
ZG8gZXZlcnl0aGluZwo+IGR1cmluZyBzdXNwZW5kL3Jlc3RvcmUgZXhjZXB0IGFjdHVhbGx5IGNh
bGxpbmcgaW50byB0aGUgQUNQSSBTMwo+IGhhbmRsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4g
R3V0aHJvIDxiZW5qYW1pbi5ndXRocm9AY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4gVGhpcyB3YXMgb3Jp
Z2luYWxseSBwb3N0ZWQgaW4gMjAxMywgYnV0IG5ldmVyIGFjdHVhbGx5IGNoZWNrZWQgaW4uCj4K
PiBJJ3ZlIHJlbW92ZWQgYW4gZXh0cmFuZW91cyBsaW5lLCBhbmQgY2hhbmdlZCB0aGUgdW5kZXJz
Y29yZSBpbiB0aGUKPiBvcHRpb24gaW50byBhIGRhc2ggKGFzIEphbiBzZWVtcyB0byBwcmVmZXIp
Lgo+Cj4gQ29tcGlsZS10ZXN0ZWQgb25seS4KPgo+IElmIHdlIHdhbnQgb3NzdGVzdCB0byBiZSBh
YmxlIHRvIHRlc3QgdGhpcyBmdW5jdGlvbmFsaXR5IGl0IHNob3VsZAo+IHByb2JhYmx5IGJlIGJh
Y2twb3J0ZWQuCj4KPiBDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4g
Q0M6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBDQzogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0Bp
bnZpc2libGV0aGluZ3NsYWIuY29tPgoKYm9vbF90ID0+IGJvb2wsIGRyb3AgdGhlIHJlZHVuZGFu
dCBpbml0aWFsaXNlciwgYW5kIHlvdSBuZWVkIHRvIHBhdGNoCnhlbi1jb21tYW5kLWxpbmUubWFy
a2Rvd24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
