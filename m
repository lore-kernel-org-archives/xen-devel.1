From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Thu, 14 Feb 2019 21:03:24 +0000
Message-ID: <AB54071B-07B5-4FFC-A1A4-781C24F61D93@gmail.com>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============8338038163610917132=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, Wei Liu <wei.liu2@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8338038163610917132==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A8EE0A2F-66F4-4E9D-8DE6-9604584B1EC8"


--Apple-Mail=_A8EE0A2F-66F4-4E9D-8DE6-9604584B1EC8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 14 Feb 2019, at 18:32, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Thu, 14 Feb 2019, Jan Beulich wrote:
>>>>> On 13.02.19 at 20:11, <sstabellini@kernel.org> wrote:
>>> On Wed, 13 Feb 2019, Wei Liu wrote:
>>>> On Tue, Feb 12, 2019 at 09:34:25PM -0500, Daniel P. Smith wrote:
>>>>> Greetings,
>>>>>=20
>>>>> On the 11/14/18 Xen x86 community call a discussion was initiated =
about
>>>>> using Kconfig to build minimized versions of Xen for security, =
safety
>>>>> and other certification requirements. After some offline =
discussions
>>>>> with Xen contributors I realized that a variety of efforts each =
with
>>>>> their own respective goals are underway,
>>>>>=20
>>>>> - nested virtualization
>>>>> - mixed criticality architectures
>>>>> - reducing trusted componentary
>>>>> - combining hardware protection of virtualization with performance =
and
>>>>> ease-of-use of containers
>>>>>=20
>>>>> These efforts use hypervisors in different roles, all which Xen is
>>>>> capable of meeting. Today Xen's utility comes at the expense of =
carrying
>>>>> features necessary for one role to be present in another role =
where it
>>>>> is not required, e.g. PV interfaces that may not be essential in =
an ARM
>>>>> mixed criticality deployment.
>>>>>=20
>>>>> The initial focus will be to explore and document the range of =
possible
>>>>> use cases that are of interest to the Xen community. This will be =
the
>>>>> input to a design document that is crafted in conjunction with the =
Xen
>>>>> maintainers, to identify possible approaches to extend the =
existing
>>>>> Kconfig infrastructure to produce tailored instances of Xen.
>>>>>=20
>>>>> If you are interested in participating in this effort, please =
reply to
>>>>> this thread to outline possible use cases, design constraints and =
other
>>>>> considerations for improving Xen's Kconfig infrastructure to =
support
>>>>> tailoring for specific use cases.
>>>>>=20
>>>>=20
>>>> My impression from the community call is that you want to provide
>>>> smallish configurations for different use cases.
>>>>=20
>>>> The Kconfig infrastructure is already able to do what you want as =
far as
>>>> I can tell.  You can easily feed it a base config file -- see files
>>>> under automation/configs/x86/.  What sort of extension is needed in =
your
>>>> opinion?
>>>>=20
>>>> As use case goes, it would be a good start if you just submit =
something
>>>> you care about.
>>>=20
>>> I mentioned on the call that a good first start could be a kconfig =
that
>>> allows to build an hypervisor binary with only support for PVH and =
only
>>> support for recent Intel machines, with the goal of minimizing the =
code
>>> base to less than 100K LOC.
>>=20
>> "With only support for PVH" (which really means HVM) we already have.
>> "With only support for recent Intel machines" would require adding =
new
>> Kconfig options first, to control Intel, AMD, etc separately, and to =
then
>> further somehow separate "old" from "new" (which may turn out not
>> very easy to do without a lot of #ifdef-ary or other code churn). I'm
>> not aware of something like this existing on Linux either - all I'm =
aware
>> of there is a means to control what -m<arch> option might be passed
>> to the compiler, but without disabling any source code from getting
>> compiled.
>=20
> I was thinking along the lines of having options to disable drivers =
for
> older timers and older interrupt controllers that are not needed on
> recent machines.
>=20
>=20
>> And then "with only support for recent Intel machines" could also =
imply
>> HAP-only; disabling shadow code (which also is already possible) will
>> alone save almost 10k LOC (counting .c files only).
>=20
> I have just run `make cloc' on x86 with the smallest possible
> configuration (HVM only):
>=20
>=20
> http://cloc.sourceforge.net <http://cloc.sourceforge.net/> v 1.60  =
T=3D0.87 s (370.3 files/s, 255808.4 lines/s)
> =
--------------------------------------------------------------------------=
-----
> Language                     files          blank        comment       =
    code
> =
--------------------------------------------------------------------------=
-----
> C                              309          33238          29432       =
  157001
> Assembly                        14            466            531       =
    2435
> =
--------------------------------------------------------------------------=
-----
> SUM:                           323          33704          29963       =
  159436
> =
--------------------------------------------------------------------------=
-----
>=20
> This is great! The last time I did the count it was above 220K LOC.  =
We
> should make more noise about this -- it is a major.

@Wei: the binary size data is not that impressive. Would it be possible =
to do the make cloc on HVM, PV and mixed?
I can include this into the PR for 4.12. Sorry for slightly hi-jacking =
the thread.
Lars=

--Apple-Mail=_A8EE0A2F-66F4-4E9D-8DE6-9604584B1EC8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 14 Feb 2019, at 18:32, Stefano Stabellini &lt;<a =
href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Thu, 14 =
Feb 2019, Jan Beulich wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">On 13.02.19 at 20:11, &lt;<a =
href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt; wrote:<br =
class=3D""></blockquote></blockquote>On Wed, 13 Feb 2019, Wei Liu =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On Tue, Feb =
12, 2019 at 09:34:25PM -0500, Daniel P. Smith wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Greetings,<br =
class=3D""><br class=3D"">On the 11/14/18 Xen x86 community call a =
discussion was initiated about<br class=3D"">using Kconfig to build =
minimized versions of Xen for security, safety<br class=3D"">and other =
certification requirements. After some offline discussions<br =
class=3D"">with Xen contributors I realized that a variety of efforts =
each with<br class=3D"">their own respective goals are underway,<br =
class=3D""><br class=3D"">- nested virtualization<br class=3D"">- mixed =
criticality architectures<br class=3D"">- reducing trusted =
componentary<br class=3D"">- combining hardware protection of =
virtualization with performance and<br class=3D"">ease-of-use of =
containers<br class=3D""><br class=3D"">These efforts use hypervisors in =
different roles, all which Xen is<br class=3D"">capable of meeting. =
Today Xen's utility comes at the expense of carrying<br =
class=3D"">features necessary for one role to be present in another role =
where it<br class=3D"">is not required, e.g. PV interfaces that may not =
be essential in an ARM<br class=3D"">mixed criticality deployment.<br =
class=3D""><br class=3D"">The initial focus will be to explore and =
document the range of possible<br class=3D"">use cases that are of =
interest to the Xen community. This will be the<br class=3D"">input to a =
design document that is crafted in conjunction with the Xen<br =
class=3D"">maintainers, to identify possible approaches to extend the =
existing<br class=3D"">Kconfig infrastructure to produce tailored =
instances of Xen.<br class=3D""><br class=3D"">If you are interested in =
participating in this effort, please reply to<br class=3D"">this thread =
to outline possible use cases, design constraints and other<br =
class=3D"">considerations for improving Xen's Kconfig infrastructure to =
support<br class=3D"">tailoring for specific use cases.<br class=3D""><br =
class=3D""></blockquote><br class=3D"">My impression from the community =
call is that you want to provide<br class=3D"">smallish configurations =
for different use cases.<br class=3D""><br class=3D"">The Kconfig =
infrastructure is already able to do what you want as far as<br =
class=3D"">I can tell. &nbsp;You can easily feed it a base config file =
-- see files<br class=3D"">under automation/configs/x86/. &nbsp;What =
sort of extension is needed in your<br class=3D"">opinion?<br =
class=3D""><br class=3D"">As use case goes, it would be a good start if =
you just submit something<br class=3D"">you care about.<br =
class=3D""></blockquote><br class=3D"">I mentioned on the call that a =
good first start could be a kconfig that<br class=3D"">allows to build =
an hypervisor binary with only support for PVH and only<br =
class=3D"">support for recent Intel machines, with the goal of =
minimizing the code<br class=3D"">base to less than 100K LOC.<br =
class=3D""></blockquote><br class=3D"">"With only support for PVH" =
(which really means HVM) we already have.<br class=3D"">"With only =
support for recent Intel machines" would require adding new<br =
class=3D"">Kconfig options first, to control Intel, AMD, etc separately, =
and to then<br class=3D"">further somehow separate "old" from "new" =
(which may turn out not<br class=3D"">very easy to do without a lot of =
#ifdef-ary or other code churn). I'm<br class=3D"">not aware of =
something like this existing on Linux either - all I'm aware<br =
class=3D"">of there is a means to control what -m&lt;arch&gt; option =
might be passed<br class=3D"">to the compiler, but without disabling any =
source code from getting<br class=3D"">compiled.<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I was thinking along the lines of having options to disable =
drivers for</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">older timers =
and older interrupt controllers that are not needed on</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">recent =
machines.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">And =
then "with only support for recent Intel machines" could also imply<br =
class=3D"">HAP-only; disabling shadow code (which also is already =
possible) will<br class=3D"">alone save almost 10k LOC (counting .c =
files only).<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I have just run `make cloc' on x86 with the smallest =
possible</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">configuration =
(HVM only):</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><a href=3D"http://cloc.sourceforge.net/" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">http://cloc.sourceforge.net</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><span class=3D"Apple-converted-space">&nbsp;</span>v 1.60 =
&nbsp;T=3D0.87 s (370.3 files/s, 255808.4 lines/s)</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">---------------------------------------------------------------=
----------------</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Language =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;files =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;blank =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;comment =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;code</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">---------------------------------------------------------------=
----------------</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">C =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;309 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;33238 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29432 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;157001</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Assembly =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;466 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;531 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2435</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">---------------------------------------------------------------=
----------------</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">SUM: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;323 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;33704 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29963 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;159436</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">---------------------------------------------------------------=
----------------</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">This is great! The last time I did the count it was above =
220K LOC. &nbsp;We</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">should make more noise about this -- it is a major.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote></div><br class=3D""><div =
class=3D"">@Wei: the binary size data is not that impressive. Would it =
be possible to do the make cloc on HVM, PV and mixed?</div><div =
class=3D"">I can include this into the PR for 4.12. Sorry for slightly =
hi-jacking the thread.</div><div class=3D"">Lars</div></body></html>=

--Apple-Mail=_A8EE0A2F-66F4-4E9D-8DE6-9604584B1EC8--


--===============8338038163610917132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8338038163610917132==--
